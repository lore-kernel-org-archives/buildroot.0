From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 11 Jul 2015 10:40:15 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/mtd: add patch to fix host
 build error with gcc 5.1
In-Reply-To: <1432636689-26907-1-git-send-email-joerg.krause@embedded.rocks>
References: <1432636689-26907-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <55A0D66F.1020204@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jorg,

Le 26/05/2015 12:38, J?rg Krause a ?crit :
> host-mtd build fails with gcc 5.1:
>   error: redefinition of ?hashtable_iterator_key?
>   error: redefinition of ?hashtable_iterator_value?
> 
> Indeed, both functions are defined twice - once in the header and once in the
> source file. This is permitted in C11 (and maybe in C99).
> 
> Add a patch sent to upstream:
> https://patchwork.ozlabs.org/patch/467254/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Build tested with Fedora 22 host and gcc 5.1.1.
Tested-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain Naour
> ---
> Changes v2 -> v3:
>   - Add Sob and URL to patch description (Baruch Siach)
> 
> Changes v1 -> v2:
>   - Use (identical) patch sent upstream
> ---
>  .../0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch   | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch
> 
> diff --git a/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch b/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch
> new file mode 100644
> index 0000000..7ae691e
> --- /dev/null
> +++ b/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch
> @@ -0,0 +1,76 @@
> +From patchwork Sat May  2 12:38:06 2015
> +Content-Type: text/plain; charset="utf-8"
> +MIME-Version: 1.0
> +Content-Transfer-Encoding: 7bit
> +Subject: mkfs.ubifs: Fix build with gcc 5.1
> +From: Bernhard Walle <bernhard@bwalle.de>
> +X-Patchwork-Id: 467254
> +Message-Id: <1430570286-30434-1-git-send-email-bernhard@bwalle.de>
> +To: linux-mtd at lists.infradead.org
> +Cc: Bernhard Walle <bernhard@bwalle.de>
> +Date: Sat,  2 May 2015 14:38:06 +0200
> +
> +In gcc 5.1, the default C standard which is used to compile a C file,
> +has changed from gnu89 to gnu11. This changed the meaning of 'extern
> +inline'. See https://gcc.gnu.org/gcc-5/porting_to.html.
> +
> +In mkfs.ubifs, this leads to multiple definitions of
> +hashtable_iterator_key and -hashtable_iterator_value. I think the most
> +pragmatic way to fix the issue is to replace 'extern inline' with
> +'static inline' here.
> +
> +Fetch from:
> +https://patchwork.ozlabs.org/patch/467254/
> +
> +Signed-off-by: Bernhard Walle <bernhard@bwalle.de>
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +---
> + mkfs.ubifs/hashtable/hashtable_itr.c | 12 ------------
> + mkfs.ubifs/hashtable/hashtable_itr.h |  4 ++--
> + 2 files changed, 2 insertions(+), 14 deletions(-)
> +
> +diff --git a/mkfs.ubifs/hashtable/hashtable_itr.c b/mkfs.ubifs/hashtable/hashtable_itr.c
> +index 24f4dde..d102453 100644
> +--- a/mkfs.ubifs/hashtable/hashtable_itr.c
> ++++ b/mkfs.ubifs/hashtable/hashtable_itr.c
> +@@ -35,18 +35,6 @@ hashtable_iterator(struct hashtable *h)
> + }
> + 
> + /*****************************************************************************/
> +-/* key      - return the key of the (key,value) pair at the current position */
> +-/* value    - return the value of the (key,value) pair at the current position */
> +-
> +-void *
> +-hashtable_iterator_key(struct hashtable_itr *i)
> +-{ return i->e->k; }
> +-
> +-void *
> +-hashtable_iterator_value(struct hashtable_itr *i)
> +-{ return i->e->v; }
> +-
> +-/*****************************************************************************/
> + /* advance - advance the iterator to the next element
> +  *           returns zero if advanced to end of table */
> + 
> +diff --git a/mkfs.ubifs/hashtable/hashtable_itr.h b/mkfs.ubifs/hashtable/hashtable_itr.h
> +index 87a97eb..5c94a04 100644
> +--- a/mkfs.ubifs/hashtable/hashtable_itr.h
> ++++ b/mkfs.ubifs/hashtable/hashtable_itr.h
> +@@ -28,7 +28,7 @@ hashtable_iterator(struct hashtable *h);
> + /* hashtable_iterator_key
> +  * - return the value of the (key,value) pair at the current position */
> + 
> +-extern inline void *
> ++static inline void *
> + hashtable_iterator_key(struct hashtable_itr *i)
> + {
> +     return i->e->k;
> +@@ -37,7 +37,7 @@ hashtable_iterator_key(struct hashtable_itr *i)
> + /*****************************************************************************/
> + /* value - return the value of the (key,value) pair at the current position */
> + 
> +-extern inline void *
> ++static inline void *
> + hashtable_iterator_value(struct hashtable_itr *i)
> + {
> +     return i->e->v;
> 
