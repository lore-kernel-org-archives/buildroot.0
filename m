From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 18:27:36 +0100
Subject: [Buildroot] [PATCH 2/3] lua: add official patches
In-Reply-To: <1389705298-27263-3-git-send-email-francois.perrad@gadz.org>
References: <1389705298-27263-1-git-send-email-francois.perrad@gadz.org>
 <1389705298-27263-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <52D57388.3070109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/01/14 14:14, Francois Perrad wrote:
> from http://www.lua.org/bugs.html
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/lua/5.1.5/lua-bug2.patch |   46 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 package/lua/5.1.5/lua-bug2.patch
>
> diff --git a/package/lua/5.1.5/lua-bug2.patch b/package/lua/5.1.5/lua-bug2.patch
> new file mode 100644
> index 0000000..729c22d
> --- /dev/null
> +++ b/package/lua/5.1.5/lua-bug2.patch
> @@ -0,0 +1,46 @@
> +When loading a file, Lua may call the reader function again after it returned end of input.

  This doesn't look like a patch related to cross-compilation or uClibc 
support, so it isn't really buildroot's business I'd say.

  Also, the patch should be numbered and it should get a better filename 
than "bug2".

  Regards,
  Arnout

> +
> +Backported from http://www.lua.org/bugs.html#5.1.5-2
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +
> +Index: b/src/lzio.c
> +===================================================================
> +--- a/src/lzio.c
> ++++ b/src/lzio.c
> +@@ -22,10 +22,14 @@
> +   size_t size;
> +   lua_State *L = z->L;
> +   const char *buff;
> ++  if (z->eoz) return EOZ;
> +   lua_unlock(L);
> +   buff = z->reader(L, z->data, &size);
> +   lua_lock(L);
> +-  if (buff == NULL || size == 0) return EOZ;
> ++  if (buff == NULL || size == 0) {
> ++    z->eoz = 1;  /* avoid calling reader function next time */
> ++    return EOZ;
> ++  }
> +   z->n = size - 1;
> +   z->p = buff;
> +   return char2int(*(z->p++));
> +@@ -51,6 +55,7 @@
> +   z->data = data;
> +   z->n = 0;
> +   z->p = NULL;
> ++  z->eoz = 0;
> + }
> +
> +
> +Index: b/src/lzio.h
> +===================================================================
> +--- a/src/lzio.h
> ++++ b/src/lzio.h
> +@@ -59,6 +59,7 @@
> +   lua_Reader reader;
> +   void* data;			/* additional data */
> +   lua_State *L;			/* Lua state (for reader) */
> ++  int eoz;			/* true if reader has no more data */
> + };
> +
> +
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
