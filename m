From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:19:57 +0100
Subject: [Buildroot] [PATCH v2 03/38] package/libdvdnav: add Kodi-specific
	patches
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Kodi build system needs .a files to create
usr/lib/kodi/system/players/VideoPlayer/libdvdnav-i486-linux.so

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-xbmc-dvdnav-allow-get-set-vm-state.patch  | 174 +++++++++++++++++++++
 ...-expose-dvdnav_get_vm-dvdnav_get_button_i.patch |  91 +++++++++++
 .../0003-xbmc-dvdnav-detection-of-dvd-name.patch   |  34 ++++
 ...-xbmc-dvdnav-skip-cell-when-unrecoverable.patch |  42 +++++
 ...-added-reading-of-VTS_TMAPT-and-TITLE_C_A.patch |  37 +++++
 .../0006-xbmc-dvdnav-various-safeguards.patch      |  46 ++++++
 ...-disallow-time-search-when-navigation-pro.patch |  34 ++++
 .../0008-xbmc-dvdnav-additional-debug-log.patch    |  28 ++++
 ...09-xbmc-dvdnav-add-timemap-to-time-search.patch | 131 ++++++++++++++++
 ...dnav-expose-dvdnav_jump_to_sector_by_time.patch |  35 +++++
 package/libdvdnav/libdvdnav.mk                     |   6 +
 11 files changed, 658 insertions(+)
 create mode 100644 package/libdvdnav/0001-xbmc-dvdnav-allow-get-set-vm-state.patch
 create mode 100644 package/libdvdnav/0002-xbmc-dvdnav-expose-dvdnav_get_vm-dvdnav_get_button_i.patch
 create mode 100644 package/libdvdnav/0003-xbmc-dvdnav-detection-of-dvd-name.patch
 create mode 100644 package/libdvdnav/0004-xbmc-dvdnav-skip-cell-when-unrecoverable.patch
 create mode 100644 package/libdvdnav/0005-xbmc-dvdnav-added-reading-of-VTS_TMAPT-and-TITLE_C_A.patch
 create mode 100644 package/libdvdnav/0006-xbmc-dvdnav-various-safeguards.patch
 create mode 100644 package/libdvdnav/0007-xbmc-dvdnav-disallow-time-search-when-navigation-pro.patch
 create mode 100644 package/libdvdnav/0008-xbmc-dvdnav-additional-debug-log.patch
 create mode 100644 package/libdvdnav/0009-xbmc-dvdnav-add-timemap-to-time-search.patch
 create mode 100644 package/libdvdnav/0010-xbmc-dvdnav-expose-dvdnav_jump_to_sector_by_time.patch

diff --git a/package/libdvdnav/0001-xbmc-dvdnav-allow-get-set-vm-state.patch b/package/libdvdnav/0001-xbmc-dvdnav-allow-get-set-vm-state.patch
new file mode 100644
index 000000000..447b52ce7
--- /dev/null
+++ b/package/libdvdnav/0001-xbmc-dvdnav-allow-get-set-vm-state.patch
@@ -0,0 +1,174 @@
+From d38f5e088ba7030220b12a505cf8a77bd9ae3707 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:10:15 +0100
+Subject: [PATCH 01/10] [xbmc][dvdnav] allow get/set vm state
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/918471a40f6ed9e8be9981e1f86ec6eaec139074
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dvdnav_internal.h | 12 +++++++++++
+ src/searching.c       | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/vm/vm.c           | 41 ++++++++++++++++++++++++++++++++++++
+ src/vm/vm.h           |  3 +++
+ 4 files changed, 114 insertions(+)
+
+diff --git a/src/dvdnav_internal.h b/src/dvdnav_internal.h
+index 534ccb8..6d936e9 100644
+--- a/src/dvdnav_internal.h
++++ b/src/dvdnav_internal.h
+@@ -222,6 +222,18 @@ struct dvdnav_s {
+ /* converts a dvd_time_t to PTS ticks */
+ int64_t dvdnav_convert_time(dvd_time_t *time);
+ 
++/* XBMC added functions */
++/*
++ * Get current playback state
++ */
++dvdnav_status_t dvdnav_get_state(dvdnav_t *this, dvd_state_t *save_state);
++
++/*
++ * Resume playback state
++ */
++dvdnav_status_t dvdnav_set_state(dvdnav_t *this, dvd_state_t *save_state);
++/* end XBMC */
++
+ /** USEFUL MACROS **/
+ 
+ #ifdef __GNUC__
+diff --git a/src/searching.c b/src/searching.c
+index f638b61..fd28fb3 100644
+--- a/src/searching.c
++++ b/src/searching.c
+@@ -731,6 +731,64 @@ fail:
+   return retval;
+ }
+ 
++dvdnav_status_t dvdnav_get_state(dvdnav_t *this, dvd_state_t *save_state)
++{
++  if (!this || !this->vm) return DVDNAV_STATUS_ERR;
++
++  pthread_mutex_lock(&this->vm_lock);
++
++  if (!vm_get_state(this->vm, save_state))
++  {
++    printerr("Failed to get vm state.");
++    pthread_mutex_unlock(&this->vm_lock);
++    return DVDNAV_STATUS_ERR;
++  }
++
++  pthread_mutex_unlock(&this->vm_lock);
++  return DVDNAV_STATUS_OK;
++}
++
++dvdnav_status_t dvdnav_set_state(dvdnav_t *this, dvd_state_t *save_state)
++{
++  if (!this || !this->vm)
++  {
++    printerr("Passed a NULL pointer.");
++    return DVDNAV_STATUS_ERR;
++  }
++
++  if (!this->started) {
++    printerr("Virtual DVD machine not started.");
++    return DVDNAV_STATUS_ERR;
++  }
++
++  pthread_mutex_lock(&this->vm_lock);
++
++  /* reset the dvdnav state */
++  memset(&this->pci, 0, sizeof(this->pci));
++  memset(&this->dsi, 0, sizeof(this->dsi));
++  this->last_cmd_nav_lbn = SRI_END_OF_CELL;
++
++  /* Set initial values of flags */
++  this->position_current.still = 0;
++  this->skip_still = 0;
++  this->sync_wait = 0;
++  this->sync_wait_skip = 0;
++  this->spu_clut_changed = 0;
++
++  /* set the state. this will also start the vm on that state */
++  /* means the next read block should be comming from that new */
++  /* state */
++  if (!vm_set_state(this->vm, save_state))
++  {
++    printerr("Failed to set vm state.");
++    pthread_mutex_unlock(&this->vm_lock);
++    return DVDNAV_STATUS_ERR;
++  }
++
++  pthread_mutex_unlock(&this->vm_lock);
++  return DVDNAV_STATUS_OK;
++}
++
+ /* Get an admap and admap_len */
+ static vobu_admap_t* dvdnav_admap_get(dvdnav_t *this, dvd_state_t *state,
+             int32_t *admap_len) {
+diff --git a/src/vm/vm.c b/src/vm/vm.c
+index 869dd05..35d08d5 100644
+--- a/src/vm/vm.c
++++ b/src/vm/vm.c
+@@ -1104,3 +1104,44 @@ void vm_ifo_close(ifo_handle_t *ifo)
+ {
+   ifoClose(ifo);
+ }
++
++int vm_get_state(vm_t *vm, dvd_state_t *save_state) {
++  *save_state = vm->state;
++  /* remove the pgc pointer as it might not be valid later*/
++  save_state->pgc = NULL;
++  return 1;  
++}
++
++int vm_set_state(vm_t *vm, dvd_state_t *save_state) {
++  /* restore state from save_state as taken from ogle */
++
++  /* open the needed vts */
++  if (!ifoOpenNewVTSI(vm, vm->dvd, save_state->vtsN)) return 0;
++  // sets state.vtsN
++
++  vm->state = *save_state;
++  /* set state.domain before calling */
++  //calls get_pgcit()
++  //      needs state.domain and sprm[0] set
++  //      sets pgcit depending on state.domain
++  //writes: state.pgc
++  //        state.pgN
++  //        state.TT_PGCN_REG
++
++  if (!set_PGCN(vm, save_state->pgcN)) return 0;
++  save_state->pgc = vm->state.pgc;
++
++  /* set the rest of state after the call */
++  vm->state = *save_state;
++
++  /* if we are not in standard playback, we must get all data */
++  /* otherwise we risk loosing stillframes, and overlays */
++  if (vm->state.domain != DVD_DOMAIN_VTSTitle)
++    vm->state.blockN = 0;
++
++  /* force a flush of data here */
++  /* we don't need a hop seek here as it's a complete state*/
++  vm->hop_channel++;
++
++  return 1;
++}
+diff --git a/src/vm/vm.h b/src/vm/vm.h
+index e4b01c2..a6fdbf9 100644
+--- a/src/vm/vm.h
++++ b/src/vm/vm.h
+@@ -161,6 +161,9 @@ subp_attr_t  vm_get_subp_attr(vm_t *vm, int streamN);
+ ifo_handle_t *vm_get_title_ifo(vm_t *vm, uint32_t title);
+ void vm_ifo_close(ifo_handle_t *ifo);
+ 
++int vm_get_state(vm_t *vm, dvd_state_t *save_state);
++int vm_set_state(vm_t *vm, dvd_state_t *save_state);
++
+ /* Uncomment for VM command tracing */
+ /* #define TRACE */
+ #ifdef TRACE
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0002-xbmc-dvdnav-expose-dvdnav_get_vm-dvdnav_get_button_i.patch b/package/libdvdnav/0002-xbmc-dvdnav-expose-dvdnav_get_vm-dvdnav_get_button_i.patch
new file mode 100644
index 000000000..27a8afa39
--- /dev/null
+++ b/package/libdvdnav/0002-xbmc-dvdnav-expose-dvdnav_get_vm-dvdnav_get_button_i.patch
@@ -0,0 +1,91 @@
+From 9242e7fe91e31706e5f79a3a3fe2c998df65a621 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:15:56 +0100
+Subject: [PATCH 02/10] [xbmc][dvdnav] expose dvdnav_get_vm,
+ dvdnav_get_button_info, dvdnav_free
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/8305696be79fe650d3d9eee29b2a88e020d7c58f
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dvdnav.c        | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/dvdnav/dvdnav.h |  1 +
+ 2 files changed, 53 insertions(+)
+
+diff --git a/src/dvdnav.c b/src/dvdnav.c
+index ae267d5..39c11dd 100644
+--- a/src/dvdnav.c
++++ b/src/dvdnav.c
+@@ -1273,3 +1273,55 @@ user_ops_t dvdnav_get_restrictions(dvdnav_t* this) {
+ 
+   return ops.ops_struct;
+ }
++
++#ifdef _XBMC
++
++vm_t* dvdnav_get_vm(dvdnav_t *this) {
++  if (!this) return 0;
++  return this->vm;
++}
++
++/* return the alpha and color for the current active button
++ * color, alpha [0][] = selection
++ * color, alpha = color
++ *
++ * argsize = [2][4]
++ */
++int dvdnav_get_button_info(dvdnav_t* this, int alpha[2][4], int color[2][4])
++{
++  int current_button, current_button_color, i;
++  pci_t* pci;
++  
++  if (!this) return -1;
++  
++  pci = dvdnav_get_current_nav_pci(this);
++  if (!pci) return -1;
++  
++  dvdnav_get_current_highlight(this, &current_button);
++  current_button_color = pci->hli.btnit[current_button - 1].btn_coln;
++  
++  for (i = 0; i < 2; i++)
++  {
++    alpha[i][0] = pci->hli.btn_colit.btn_coli[current_button_color - 1][i] >> 0 & 0xf;
++    alpha[i][1] = pci->hli.btn_colit.btn_coli[current_button_color - 1][i] >> 4 & 0xf;
++    alpha[i][2] = pci->hli.btn_colit.btn_coli[current_button_color - 1][i] >> 8 & 0xf;
++    alpha[i][3] = pci->hli.btn_colit.btn_coli[current_button_color - 1][i] >> 12 & 0xf;
++
++    color[i][0] = pci->hli.btn_colit.btn_coli[current_button_color - 1][i] >> 16 & 0xf;
++    color[i][1] = pci->hli.btn_colit.btn_coli[current_button_color - 1][i] >> 20 & 0xf;
++    color[i][2] = pci->hli.btn_colit.btn_coli[current_button_color - 1][i] >> 24 & 0xf;
++    color[i][3] = pci->hli.btn_colit.btn_coli[current_button_color - 1][i] >> 28 & 0xf;
++  }
++
++  return 0;
++}
++
++void dvdnav_free(void* pdata)
++{
++  free(pdata);
++}
++
++#undef printerr
++#define printerr(str) strncpy(self->err_str, str, MAX_ERR_LEN);
++
++#endif // _XBMC
+\ No newline at end of file
+diff --git a/src/dvdnav/dvdnav.h b/src/dvdnav/dvdnav.h
+index 8d68102..9f82b0f 100644
+--- a/src/dvdnav/dvdnav.h
++++ b/src/dvdnav/dvdnav.h
+@@ -699,6 +699,7 @@ int8_t dvdnav_is_domain_vtsm(dvdnav_t *self);
+  */
+ int8_t dvdnav_is_domain_vts(dvdnav_t *self);
+ 
++void dvdnav_free(void* pdata);
+ 
+ #ifdef __cplusplus
+ }
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0003-xbmc-dvdnav-detection-of-dvd-name.patch b/package/libdvdnav/0003-xbmc-dvdnav-detection-of-dvd-name.patch
new file mode 100644
index 000000000..0622f684e
--- /dev/null
+++ b/package/libdvdnav/0003-xbmc-dvdnav-detection-of-dvd-name.patch
@@ -0,0 +1,34 @@
+From 848e08ef0cfd19e59fcf7ac0973e947d971a787c Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:17:58 +0100
+Subject: [PATCH 03/10] [xbmc][dvdnav] detection of dvd name
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/d265f78a136f9068dee186030c4032c12dcf553a
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/vm/vm.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/vm/vm.c b/src/vm/vm.c
+index 35d08d5..7ff285d 100644
+--- a/src/vm/vm.c
++++ b/src/vm/vm.c
+@@ -409,6 +409,13 @@ int vm_reset(vm_t *vm, const char *dvdroot,
+     if(dvd_read_name(vm->dvd_name, vm->dvd_serial, dvdroot) != 1) {
+       fprintf(MSG_OUT, "libdvdnav: vm: dvd_read_name failed\n");
+     }
++#ifdef _XBMC
++    if (DVDUDFVolumeInfo(vm->dvd, vm->dvd_name, sizeof(vm->dvd_name), NULL, 0))
++      if (DVDISOVolumeInfo(vm->dvd, vm->dvd_name, sizeof(vm->dvd_name), NULL, 0))
++        strcpy(vm->dvd_name, "");
++
++    fprintf(MSG_OUT, "libdvdnav: vm: DVD Title: %s\n", vm->dvd_name);
++#endif
+   }
+   if (vm->vmgi) {
+     int i, mask;
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0004-xbmc-dvdnav-skip-cell-when-unrecoverable.patch b/package/libdvdnav/0004-xbmc-dvdnav-skip-cell-when-unrecoverable.patch
new file mode 100644
index 000000000..61b71bf35
--- /dev/null
+++ b/package/libdvdnav/0004-xbmc-dvdnav-skip-cell-when-unrecoverable.patch
@@ -0,0 +1,42 @@
+From 954bb505a33326ddee6ab564e5c5a5c2b71c15d1 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:19:12 +0100
+Subject: [PATCH 04/10] [xbmc][dvdnav] skip cell when unrecoverable
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/fe6af9cc2aab9954b0071699dc5ea1ae6ae2e244
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dvdnav.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/dvdnav.c b/src/dvdnav.c
+index 39c11dd..3b61059 100644
+--- a/src/dvdnav.c
++++ b/src/dvdnav.c
+@@ -564,6 +564,10 @@ dvdnav_status_t dvdnav_get_next_cache_block(dvdnav_t *this, uint8_t **buf,
+         /* Decode nav into pci and dsi. Then get next VOBU info. */
+         if(!dvdnav_decode_packet(*buf, &this->dsi, &this->pci)) {
+           printerr("Expected NAV packet but none found.");
++#ifdef _XBMC
++          /* skip this cell as we won't recover from this*/
++          vm_get_next_cell(this->vm);
++#endif
+           pthread_mutex_unlock(&this->vm_lock);
+           return DVDNAV_STATUS_ERR;
+         }
+@@ -860,6 +864,10 @@ dvdnav_status_t dvdnav_get_next_cache_block(dvdnav_t *this, uint8_t **buf,
+     /* Decode nav into pci and dsi. Then get next VOBU info. */
+     if(!dvdnav_decode_packet(*buf, &this->dsi, &this->pci)) {
+       printerr("Expected NAV packet but none found.");
++#ifdef _XBMC
++      /* skip this cell as we won't recover from this*/
++      vm_get_next_cell(this->vm);
++#endif
+       pthread_mutex_unlock(&this->vm_lock);
+       return DVDNAV_STATUS_ERR;
+     }
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0005-xbmc-dvdnav-added-reading-of-VTS_TMAPT-and-TITLE_C_A.patch b/package/libdvdnav/0005-xbmc-dvdnav-added-reading-of-VTS_TMAPT-and-TITLE_C_A.patch
new file mode 100644
index 000000000..655f3944f
--- /dev/null
+++ b/package/libdvdnav/0005-xbmc-dvdnav-added-reading-of-VTS_TMAPT-and-TITLE_C_A.patch
@@ -0,0 +1,37 @@
+From 6114b0751acdb91d8887ad068c70097e5b727335 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:20:50 +0100
+Subject: [PATCH 05/10] [xbmc][dvdnav] added reading of VTS_TMAPT and
+ TITLE_C_ADT
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/27fd0e17a3bfe2a592563061ddc36824bece1a7c
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/vm/vm.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/vm/vm.c b/src/vm/vm.c
+index 7ff285d..1794ce7 100644
+--- a/src/vm/vm.c
++++ b/src/vm/vm.c
+@@ -252,6 +252,15 @@ int ifoOpenNewVTSI(vm_t *vm, dvd_reader_t *dvd, int vtsN) {
+     fprintf(MSG_OUT, "libdvdnav: ifoRead_TITLE_VOBU_ADMAP vtsi failed\n");
+     return 0;
+   }
++  if (!ifoRead_VTS_TMAPT(vm->vtsi)) {
++    fprintf(MSG_OUT, "libdvdnav: ifoRead_VTS_TMAPT vtsi failed\n");
++    return 0;    
++  }
++  if (!ifoRead_TITLE_C_ADT(vm->vtsi)) {
++    fprintf(MSG_OUT, "libdvdnav: ifoRead_TITLE_C_ADT vtsi failed\n");
++    return 0;
++  }
++
+   vm->state.vtsN = vtsN;
+ 
+   return 1;
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0006-xbmc-dvdnav-various-safeguards.patch b/package/libdvdnav/0006-xbmc-dvdnav-various-safeguards.patch
new file mode 100644
index 000000000..d812eda93
--- /dev/null
+++ b/package/libdvdnav/0006-xbmc-dvdnav-various-safeguards.patch
@@ -0,0 +1,46 @@
+From 642157de5d8eb266ef1bce8bf4f200470220e1a6 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:22:15 +0100
+Subject: [PATCH 06/10] [xbmc][dvdnav] various safeguards
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/b6e55ae95562c094f1da9f1062c6c87bb82f1013
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dvdnav.c     | 5 +++++
+ src/read_cache.c | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/dvdnav.c b/src/dvdnav.c
+index 3b61059..c188420 100644
+--- a/src/dvdnav.c
++++ b/src/dvdnav.c
+@@ -1265,6 +1265,11 @@ user_ops_t dvdnav_get_restrictions(dvdnav_t* this) {
+ 
+   ops.ops_int = 0;
+ 
++  if (!this) {
++    printerr("Passed a NULL pointer.");
++    return ops.ops_struct;
++  }
++
+   if(!this->started) {
+     printerr("Virtual DVD machine not started.");
+     return ops.ops_struct;
+diff --git a/src/read_cache.c b/src/read_cache.c
+index 1b2862d..1e1c37d 100644
+--- a/src/read_cache.c
++++ b/src/read_cache.c
+@@ -335,7 +335,7 @@ dvdnav_status_t dvdnav_free_cache_block(dvdnav_t *self, unsigned char *buf) {
+   pthread_mutex_lock(&cache->lock);
+   for (i = 0; i < READ_CACHE_CHUNKS; i++) {
+     if (cache->chunk[i].cache_buffer && buf >= cache->chunk[i].cache_buffer &&
+-        buf < cache->chunk[i].cache_buffer + cache->chunk[i].cache_malloc_size * DVD_VIDEO_LB_LEN) {
++        buf < cache->chunk[i].cache_buffer + cache->chunk[i].cache_malloc_size * DVD_VIDEO_LB_LEN && cache->chunk[i].usage_count > 0) {
+       cache->chunk[i].usage_count--;
+     }
+   }
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0007-xbmc-dvdnav-disallow-time-search-when-navigation-pro.patch b/package/libdvdnav/0007-xbmc-dvdnav-disallow-time-search-when-navigation-pro.patch
new file mode 100644
index 000000000..97ba1d9ad
--- /dev/null
+++ b/package/libdvdnav/0007-xbmc-dvdnav-disallow-time-search-when-navigation-pro.patch
@@ -0,0 +1,34 @@
+From fcb4549674008e4464f1c6859d6b76933b56a5d5 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:24:01 +0100
+Subject: [PATCH 07/10] [xbmc][dvdnav] disallow time search when navigation
+ prohibits
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/af1b101e01a66912c6d2a595a16b9e3f4530b406
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/searching.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/searching.c b/src/searching.c
+index fd28fb3..1c9ed6f 100644
+--- a/src/searching.c
++++ b/src/searching.c
+@@ -121,6 +121,12 @@ dvdnav_status_t dvdnav_time_search(dvdnav_t *this,
+     return DVDNAV_STATUS_ERR;
+   }
+ 
++  if ((state->pgc->prohibited_ops.title_or_time_play == 1) ||
++    (this->pci.pci_gi.vobu_uop_ctl.title_or_time_play == 1)){
++    printerr("operation forbidden.");
++    pthread_mutex_unlock(&this->vm_lock);
++    return DVDNAV_STATUS_ERR;
++  }
+ 
+   this->cur_cell_time = 0;
+   if (this->pgc_based) {
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0008-xbmc-dvdnav-additional-debug-log.patch b/package/libdvdnav/0008-xbmc-dvdnav-additional-debug-log.patch
new file mode 100644
index 000000000..0988e1cdb
--- /dev/null
+++ b/package/libdvdnav/0008-xbmc-dvdnav-additional-debug-log.patch
@@ -0,0 +1,28 @@
+From 38e8173fe84eef94afcacb1e75519e9d14544da0 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:25:11 +0100
+Subject: [PATCH 08/10] [xbmc][dvdnav] additional debug log
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/a0147c857f3b877826cec68d1ef685ed0d07fb00
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/searching.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/searching.c b/src/searching.c
+index 1c9ed6f..1271f87 100644
+--- a/src/searching.c
++++ b/src/searching.c
+@@ -208,6 +208,7 @@ dvdnav_status_t dvdnav_sector_search(dvdnav_t *this,
+ 
+   result = dvdnav_get_position(this, &target, &length);
+   if(!result) {
++    printerr("Cannot get current position");
+     return DVDNAV_STATUS_ERR;
+   }
+ 
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0009-xbmc-dvdnav-add-timemap-to-time-search.patch b/package/libdvdnav/0009-xbmc-dvdnav-add-timemap-to-time-search.patch
new file mode 100644
index 000000000..4a26b6ade
--- /dev/null
+++ b/package/libdvdnav/0009-xbmc-dvdnav-add-timemap-to-time-search.patch
@@ -0,0 +1,131 @@
+From cbca487053d37854ad9b434e4008c8c8993587d1 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:26:26 +0100
+Subject: [PATCH 09/10] [xbmc][dvdnav] add timemap to time search
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/b18263f791a0c8cf17fcf6f81db7039d3b94caab
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/searching.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 86 insertions(+), 5 deletions(-)
+
+diff --git a/src/searching.c b/src/searching.c
+index 1271f87..ba7481b 100644
+--- a/src/searching.c
++++ b/src/searching.c
+@@ -142,24 +142,105 @@ dvdnav_status_t dvdnav_time_search(dvdnav_t *this,
+       last_cell_nr = state->pgc->nr_of_cells;
+   }
+ 
++
++  /* FIXME: using time map is not going to work unless we are pgc_based */
++  /*        we'd need to recalculate the time to be relative to full pgc first*/
++  if (!this->pgc_based)
++  {
++#ifdef LOG_DEBUG
++    fprintf(MSG_OUT, "libdvdnav: time_search - not pgc based\n");
++#endif
++    goto timemapdone;
++  }
++
++  if (!this->vm->vtsi->vts_tmapt){
++  /* no time map for this program chain */
++#ifdef LOG_DEBUG
++    fprintf(MSG_OUT, "libdvdnav: time_search - no time map for this program chain\n");
++#endif
++    goto timemapdone;
++  }
++
++  if (this->vm->vtsi->vts_tmapt->nr_of_tmaps < state->pgcN){
++  /* to few time maps for this program chain */
++#ifdef LOG_DEBUG
++    fprintf(MSG_OUT, "libdvdnav: time_search - to few time maps for this program chain\n");
++#endif
++    goto timemapdone;
++  }
++
++  /* get the tmpat corresponding to the pgc */
++  vts_tmap_t *tmap = &(this->vm->vtsi->vts_tmapt->tmap[state->pgcN - 1]);
++  if (tmap->tmu == 0){
++  /* no time unit for this time map */
++#ifdef LOG_DEBUG
++    fprintf(MSG_OUT, "libdvdnav: time_search - no time unit for this time map\n");
++#endif
++    goto timemapdone;
++  }
++
++  /* time is in pts (90khz clock), get the number of tmu's that represent */
++  /* first entry defines at time tmu not time zero */
++  int entry = time / tmap->tmu / 90000 - 1;
++  if (entry > tmap->nr_of_entries)
++  entry = tmap->nr_of_entries - 1;
++
++  if (entry > 0)
++  {
++    /* get the table entry, disregarding marking of discontinuity */
++    target = tmap->map_ent[entry] & 0x7fffffff;
++  }
++  else
++  {
++    /* start from first vobunit */
++    target = state->pgc->cell_playback[first_cell_nr - 1].first_sector;;
++  }
++
++  /* if we have an additional entry we can interpolate next position */
++  /* allowed only if next entry isn't discontinious */
++
++  if (entry < tmap->nr_of_entries - 1)
++  {
++    const uint32_t target2 = tmap->map_ent[entry + 1];
++    const uint64_t timeunit = tmap->tmu * 90000;
++    if (!(target2 & 0x80000000))
++    {
++      length = target2 - target;
++      target += (uint32_t)(length * (time - (entry + 1)*timeunit) / timeunit);
++    }
++  }
++  found = 1;
++
++timemapdone:
++
+   found = 0;
+-  for(cell_nr = first_cell_nr; (cell_nr <= last_cell_nr) && !found; cell_nr ++) {
++  for(cell_nr = first_cell_nr; (cell_nr <= last_cell_nr); cell_nr ++) {
+     cell =  &(state->pgc->cell_playback[cell_nr-1]);
+     if(cell->block_type == BLOCK_TYPE_ANGLE_BLOCK && cell->block_mode != BLOCK_MODE_FIRST_CELL)
+       continue;
++
++    if (found) {
++      if (target >= cell->first_sector
++      &&  target <= cell->last_sector)
++        break;
++    } else {
+     length = dvdnav_convert_time(&cell->playback_time);
+-    if (target >= length) {
+-      target -= length;
++    if (time >= length) {
++      time -= length;
+     } else {
+       /* FIXME: there must be a better way than interpolation */
+-      target = target * (cell->last_sector - cell->first_sector + 1) / length;
++      target = time * (cell->last_sector - cell->first_sector + 1) / length;
+       target += cell->first_sector;
+ 
++#ifdef LOG_DEBUG
++      if (cell->first_sector > target || target > cell->last_sector)
++      fprintf(MSG_OUT, "libdvdnav: time_search - sector is not within cell min:%u, max:%u, cur:%u\n", cell->first_sector, cell->last_sector, target);
++#endif
+       found = 1;
+       break;
+     }
+   }
+-
++  }
+   if(found) {
+     uint32_t vobu;
+ #ifdef LOG_DEBUG
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/0010-xbmc-dvdnav-expose-dvdnav_jump_to_sector_by_time.patch b/package/libdvdnav/0010-xbmc-dvdnav-expose-dvdnav_jump_to_sector_by_time.patch
new file mode 100644
index 000000000..6ae98603d
--- /dev/null
+++ b/package/libdvdnav/0010-xbmc-dvdnav-expose-dvdnav_jump_to_sector_by_time.patch
@@ -0,0 +1,35 @@
+From 2b8ad34881a9b6d7d8ca38dcb1481468064284f0 Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sun, 14 Feb 2016 17:35:59 +0100
+Subject: [PATCH 10/10] [xbmc][dvdnav] expose dvdnav_jump_to_sector_by_time
+
+Downloaded from
+https://github.com/xbmc/libdvdnav/commit/9f6be84a6972084cc5197e5eb7d4eb482b66ee6e
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dvdnav/dvdnav.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/dvdnav/dvdnav.h b/src/dvdnav/dvdnav.h
+index 9f82b0f..731c0ee 100644
+--- a/src/dvdnav/dvdnav.h
++++ b/src/dvdnav/dvdnav.h
+@@ -382,6 +382,14 @@ dvdnav_status_t dvdnav_sector_search(dvdnav_t *self,
+ int64_t dvdnav_get_current_time(dvdnav_t *self);
+ 
+ /*
++ * Find the nearest vobu and jump to it
++ *
++ * Alternative to dvdnav_time_search
++ */
++dvdnav_status_t dvdnav_jump_to_sector_by_time(dvdnav_t *this, 
++                                              uint64_t time_in_pts_ticks, int32_t mode);
++
++/*
+  * Stop playing the current position and start playback of the title
+  * from the specified timecode.
+  *
+-- 
+2.8.1
+
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index b53f0c821..ab4bb35ed 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -14,4 +14,10 @@ LIBDVDNAV_LICENSE_FILES = COPYING
 # 0001-do-not-match-nios2-as-os2.patch
 LIBDVDNAV_AUTORECONF = YES
 
+# enable Kodi-specific code
+ifeq ($(BR2_PACKAGE_KODI),y)
+LIBDVDNAV_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC -D_XBMC"
+LIBDVDNAV_CONF_OPTS = --enable-static --with-pic
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
