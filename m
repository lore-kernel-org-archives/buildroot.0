From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Sep 2012 13:08:19 +0200
Subject: [Buildroot] [git commit] busybox: add 1.19.4 / 1.20.2 fixes
Message-ID: <20120904110844.1439997180@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ec1c5d9d31b4f377c91a0451efd3ba67416d6f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.19.4/busybox-1.19.4-udhcp.patch      |  164 ++++++++++++++++++++
 .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   25 +++
 2 files changed, 189 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.19.4/busybox-1.19.4-udhcp.patch b/package/busybox/busybox-1.19.4/busybox-1.19.4-udhcp.patch
new file mode 100644
index 0000000..94d5f34
--- /dev/null
+++ b/package/busybox/busybox-1.19.4/busybox-1.19.4-udhcp.patch
@@ -0,0 +1,164 @@
+--- busybox-1.19.4/networking/udhcp/common.c
++++ busybox-1.19.4-udhcp/networking/udhcp/common.c
+@@ -29,16 +29,16 @@ const struct dhcp_optflag dhcp_optflags[
+ //	{ OPTION_IP | OPTION_LIST                 , 0x07 }, /* DHCP_LOG_SERVER    */
+ //	{ OPTION_IP | OPTION_LIST                 , 0x08 }, /* DHCP_COOKIE_SERVER */
+ 	{ OPTION_IP | OPTION_LIST                 , 0x09 }, /* DHCP_LPR_SERVER    */
+-	{ OPTION_STRING               | OPTION_REQ, 0x0c }, /* DHCP_HOST_NAME     */
++	{ OPTION_STRING_HOST          | OPTION_REQ, 0x0c }, /* DHCP_HOST_NAME     */
+ 	{ OPTION_U16                              , 0x0d }, /* DHCP_BOOT_SIZE     */
+-	{ OPTION_STRING               | OPTION_REQ, 0x0f }, /* DHCP_DOMAIN_NAME   */
++	{ OPTION_STRING_HOST          | OPTION_REQ, 0x0f }, /* DHCP_DOMAIN_NAME   */
+ 	{ OPTION_IP                               , 0x10 }, /* DHCP_SWAP_SERVER   */
+ 	{ OPTION_STRING                           , 0x11 }, /* DHCP_ROOT_PATH     */
+ 	{ OPTION_U8                               , 0x17 }, /* DHCP_IP_TTL        */
+ 	{ OPTION_U16                              , 0x1a }, /* DHCP_MTU           */
+ 	{ OPTION_IP                   | OPTION_REQ, 0x1c }, /* DHCP_BROADCAST     */
+ 	{ OPTION_IP_PAIR | OPTION_LIST            , 0x21 }, /* DHCP_ROUTES        */
+-	{ OPTION_STRING                           , 0x28 }, /* DHCP_NIS_DOMAIN    */
++	{ OPTION_STRING_HOST                      , 0x28 }, /* DHCP_NIS_DOMAIN    */
+ 	{ OPTION_IP | OPTION_LIST                 , 0x29 }, /* DHCP_NIS_SERVER    */
+ 	{ OPTION_IP | OPTION_LIST     | OPTION_REQ, 0x2a }, /* DHCP_NTP_SERVER    */
+ 	{ OPTION_IP | OPTION_LIST                 , 0x2c }, /* DHCP_WINS_SERVER   */
+@@ -46,7 +46,7 @@ const struct dhcp_optflag dhcp_optflags[
+ 	{ OPTION_IP                               , 0x36 }, /* DHCP_SERVER_ID     */
+ 	{ OPTION_STRING                           , 0x38 }, /* DHCP_ERR_MESSAGE   */
+ //TODO: must be combined with 'sname' and 'file' handling:
+-	{ OPTION_STRING                           , 0x42 }, /* DHCP_TFTP_SERVER_NAME */
++	{ OPTION_STRING_HOST                      , 0x42 }, /* DHCP_TFTP_SERVER_NAME */
+ 	{ OPTION_STRING                           , 0x43 }, /* DHCP_BOOT_FILE     */
+ //TODO: not a string, but a set of LASCII strings:
+ //	{ OPTION_STRING                           , 0x4D }, /* DHCP_USER_CLASS    */
+@@ -143,6 +143,7 @@ const uint8_t dhcp_option_lengths[] ALIG
+ 	[OPTION_IP_PAIR] = 8,
+ //	[OPTION_BOOLEAN] = 1,
+ 	[OPTION_STRING] =  1,  /* ignored by udhcp_str2optset */
++	[OPTION_STRING_HOST] = 1,  /* ignored by udhcp_str2optset */
+ #if ENABLE_FEATURE_UDHCP_RFC3397
+ 	[OPTION_DNS_STRING] = 1,  /* ignored by both udhcp_str2optset and xmalloc_optname_optval */
+ 	[OPTION_SIP_SERVERS] = 1,
+@@ -411,7 +412,9 @@ static NOINLINE void attach_option(
+ 			/* actually 255 is ok too, but adding a space can overlow it */
+ 
+ 			existing->data = xrealloc(existing->data, OPT_DATA + 1 + old_len + length);
+-			if ((optflag->flags & OPTION_TYPE_MASK) == OPTION_STRING) {
++			if ((optflag->flags & OPTION_TYPE_MASK) == OPTION_STRING
++			 || (optflag->flags & OPTION_TYPE_MASK) == OPTION_STRING_HOST
++			) {
+ 				/* add space separator between STRING options in a list */
+ 				existing->data[OPT_DATA + old_len] = ' ';
+ 				old_len++;
+@@ -475,6 +478,7 @@ int FAST_FUNC udhcp_str2optset(const cha
+ 				retval = udhcp_str2nip(val, buffer + 4);
+ 			break;
+ 		case OPTION_STRING:
++		case OPTION_STRING_HOST:
+ #if ENABLE_FEATURE_UDHCP_RFC3397
+ 		case OPTION_DNS_STRING:
+ #endif
+--- busybox-1.19.4/networking/udhcp/common.h
++++ busybox-1.19.4-udhcp/networking/udhcp/common.h
+@@ -80,6 +80,9 @@ enum {
+ 	OPTION_IP = 1,
+ 	OPTION_IP_PAIR,
+ 	OPTION_STRING,
++	/* Opts of STRING_HOST type will be sanitized before they are passed
++	 * to udhcpc script's environment: */
++	OPTION_STRING_HOST,
+ //	OPTION_BOOLEAN,
+ 	OPTION_U8,
+ 	OPTION_U16,
+--- busybox-1.19.4/networking/udhcp/dhcpc.c
++++ busybox-1.19.4-udhcp/networking/udhcp/dhcpc.c
+@@ -101,6 +101,7 @@ static const uint8_t len_of_option_as_st
+ 	[OPTION_IP_PAIR         ] = sizeof("255.255.255.255 ") * 2,
+ 	[OPTION_STATIC_ROUTES   ] = sizeof("255.255.255.255/32 255.255.255.255 "),
+ 	[OPTION_STRING          ] = 1,
++	[OPTION_STRING_HOST     ] = 1,
+ #if ENABLE_FEATURE_UDHCP_RFC3397
+ 	[OPTION_DNS_STRING      ] = 1, /* unused */
+ 	/* Hmmm, this severely overestimates size if SIP_SERVERS option
+@@ -135,6 +136,63 @@ static int mton(uint32_t mask)
+ 	return i;
+ }
+ 
++/* Check if a given label represents a valid DNS label
++ * Return pointer to the first character after the label upon success,
++ * NULL otherwise.
++ * See RFC1035, 2.3.1
++ */
++/* We don't need to be particularly anal. For example, allowing _, hyphen
++ * at the end, or leading and trailing dots would be ok, since it
++ * can't be used for attacks. (Leading hyphen can be, if someone uses
++ * cmd "$hostname"
++ * in the script: then hostname may be treated as an option)
++ */
++static const char *valid_domain_label(const char *label)
++{
++	unsigned char ch;
++	unsigned pos = 0;
++
++	for (;;) {
++		ch = *label;
++		if ((ch|0x20) < 'a' || (ch|0x20) > 'z') {
++			if (pos == 0) {
++				/* label must begin with letter */
++				return NULL;
++			}
++			if (ch < '0' || ch > '9') {
++				if (ch == '\0' || ch == '.')
++					return label;
++				/* DNS allows only '-', but we are more permissive */
++				if (ch != '-' && ch != '_')
++					return NULL;
++			}
++		}
++		label++;
++		pos++;
++		//Do we want this?
++		//if (pos > 63) /* NS_MAXLABEL; labels must be 63 chars or less */
++		//	return NULL;
++	}
++}
++
++/* Check if a given name represents a valid DNS name */
++/* See RFC1035, 2.3.1 */
++static int good_hostname(const char *name)
++{
++	//const char *start = name;
++
++	for (;;) {
++		name = valid_domain_label(name);
++		if (!name)
++			return 0;
++		if (!name[0])
++			return 1;
++			//Do we want this?
++			//return ((name - start) < 1025); /* NS_MAXDNAME */
++		name++;
++	}
++}
++
+ /* Create "opt_name=opt_value" string */
+ static NOINLINE char *xmalloc_optname_optval(uint8_t *option, const struct dhcp_optflag *optflag, const char *opt_name)
+ {
+@@ -185,8 +243,11 @@ static NOINLINE char *xmalloc_optname_op
+ 			break;
+ 		}
+ 		case OPTION_STRING:
++		case OPTION_STRING_HOST:
+ 			memcpy(dest, option, len);
+ 			dest[len] = '\0';
++			if (type == OPTION_STRING_HOST && !good_hostname(dest))
++				safe_strncpy(dest, "bad", len);
+ 			return ret;	 /* Short circuit this case */
+ 		case OPTION_STATIC_ROUTES: {
+ 			/* Option binary format:
+@@ -314,6 +375,7 @@ static char **fill_envp(struct dhcp_pack
+ 	/* +1 element for each option, +2 for subnet option: */
+ 	if (packet) {
+ 		/* note: do not search for "pad" (0) and "end" (255) options */
++//TODO: change logic to scan packet _once_
+ 		for (i = 1; i < 255; i++) {
+ 			temp = udhcp_get_option(packet, i);
+ 			if (temp) {
diff --git a/package/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch b/package/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
new file mode 100644
index 0000000..456fb08
--- /dev/null
+++ b/package/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
@@ -0,0 +1,25 @@
+--- busybox-1.20.2/libbb/kernel_version.c
++++ busybox-1.20.2-kernel_ver/libbb/kernel_version.c
+@@ -20,18 +20,15 @@
+ int FAST_FUNC get_linux_version_code(void)
+ {
+ 	struct utsname name;
+-	char *s;
++	char *s, *t;
+ 	int i, r;
+ 
+-	if (uname(&name) == -1) {
+-		bb_perror_msg("can't get system information");
+-		return 0;
+-	}
+-
++	uname(&name); /* never fails */
+ 	s = name.release;
+ 	r = 0;
+ 	for (i = 0; i < 3; i++) {
+-		r = r * 256 + atoi(strtok(s, "."));
++		t = strtok(s, ".");
++		r = r * 256 + (t ? atoi(t) : 0);
+ 		s = NULL;
+ 	}
+ 	return r;
