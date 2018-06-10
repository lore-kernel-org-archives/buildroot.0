From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Jun 2018 08:07:52 +0300
Subject: [Buildroot] [PATCH 1/1] flatcc: fix gcc8 compilation
In-Reply-To: <1528485665-16141-1-git-send-email-JoelsonCarl@gmail.com>
References: <1528485665-16141-1-git-send-email-JoelsonCarl@gmail.com>
Message-ID: <20180610050752.jmelbkorsc3ejzbn@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joel,

On Fri, Jun 08, 2018 at 01:21:05PM -0600, Joel Carlson wrote:
> gcc8 issues errors for uses of strncpy where the NULL terminator may not
> be copied. This patches flatcc to fix those instances.
> 
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> 
> ---
> Upstream is aware of the issue (see [1]), so this patch may get dropped when a
> new version of flatcc is released and we bump to it.
> 
> [1] https://github.com/dvidelabs/flatcc/pull/86

As the upstream maintainer noted in that pull request, this is not a correct 
fix. Upstream commit c0df0b6fca4fa6b should fix the issue. I'll give it a try 
later today, if you don't beat me to it.

baruch

> ---
>  package/flatcc/0001-gcc8-strncpy-errors.patch | 71 +++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 package/flatcc/0001-gcc8-strncpy-errors.patch
> 
> diff --git a/package/flatcc/0001-gcc8-strncpy-errors.patch b/package/flatcc/0001-gcc8-strncpy-errors.patch
> new file mode 100644
> index 0000000..bf7d35b
> --- /dev/null
> +++ b/package/flatcc/0001-gcc8-strncpy-errors.patch
> @@ -0,0 +1,71 @@
> +Fix compilation with gcc8
> +
> +gcc8 issues errors for uses of strncpy where the NULL terminator may not be
> +copied.
> +
> +Upstream is aware of the issue, and it is possible this patch may be removed
> +when the version is bumped in the future.
> +
> +Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> +
> +diff --git a/include/flatcc/reflection/flatbuffers_common_reader.h b/include/flatcc/reflection/flatbuffers_common_reader.h
> +index faa7a9f..b86ffbc 100644
> +--- a/include/flatcc/reflection/flatbuffers_common_reader.h
> ++++ b/include/flatcc/reflection/flatbuffers_common_reader.h
> +@@ -433,7 +433,12 @@ static inline T N ## _ ## NK(N ## _struct_t t) { return t ? &(t->NK) : 0; }
> + /* If fid is null, the function returns true without testing as buffer is not expected to have any id. */
> + static inline int flatbuffers_has_identifier(const void *buffer, const char *fid)
> + { flatbuffers_thash_t id, id2 = 0; if (fid == 0) { return 1; };
> +-  strncpy((char *)&id2, fid, sizeof(id2));
> ++  const char *s;
> ++  unsigned int i;
> ++  for (s = fid, i = 0; i < sizeof(id2); ++i) {
> ++    ((char *)&id2)[i] = *s;
> ++    s += *s != 0;
> ++  }
> +   /* Identifier strings are always considered little endian. */
> +   id2 = __flatbuffers_thash_cast_from_le(id2);
> +   id = __flatbuffers_thash_read_from_pe(((flatbuffers_uoffset_t *)buffer) + 1);
> +diff --git a/src/runtime/json_printer.c b/src/runtime/json_printer.c
> +index 8fe2483..5baceb2 100644
> +--- a/src/runtime/json_printer.c
> ++++ b/src/runtime/json_printer.c
> +@@ -1013,6 +1013,8 @@ static int accept_header(flatcc_json_printer_t * ctx,
> +         const void *buf, size_t bufsiz, const char *fid)
> + {
> +     flatbuffers_thash_t id, id2 = 0;
> ++    const char *s;
> ++    unsigned int i;
> + 
> +     if (buf == 0 || bufsiz < offset_size + FLATBUFFERS_IDENTIFIER_SIZE) {
> +         RAISE_ERROR(bad_input);
> +@@ -1020,7 +1022,10 @@ static int accept_header(flatcc_json_printer_t * ctx,
> +         return 0;
> +     }
> +     if (fid != 0) {
> +-        strncpy((char *)&id2, fid, FLATBUFFERS_IDENTIFIER_SIZE);
> ++        for (s = fid, i = 0; i < sizeof(id2); ++i) {
> ++            ((char *)&id2)[i] = *s;
> ++            s += *s != 0;
> ++        }
> +         id2 = __flatbuffers_thash_cast_from_le(id2);
> +         id = __flatbuffers_thash_read_from_pe((uint8_t *)buf + offset_size);
> +         if (!(id2 == 0 || id == id2)) {
> +diff --git a/src/runtime/verifier.c b/src/runtime/verifier.c
> +index 68dbc1b..0733ff0 100644
> +--- a/src/runtime/verifier.c
> ++++ b/src/runtime/verifier.c
> +@@ -111,7 +111,12 @@ static inline uoffset_t read_uoffset(const void *p, uoffset_t base)
> + static inline thash_t read_thash_identifier(const char *identifier)
> + {
> +     flatbuffers_thash_t id = 0;
> +-    strncpy((char *)&id, identifier, sizeof(id));
> ++    const char *s;
> ++    unsigned int i;
> ++    for (s = identifier, i = 0; i < sizeof(id); ++i) {
> ++        ((char *)&id)[i] = *s;
> ++        s += *s != 0;
> ++    }
> +     return __flatbuffers_thash_cast_from_le(id);
> + }
> + 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
