From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 3 Oct 2017 12:05:39 +0200
Subject: [Buildroot] [PATCH v3 4/6] package/go: Add HOST_GO_CGO_ENABLED
In-Reply-To: <aada378f523bb232ae4d0a23e09dc07c0aff40f0.1464286518.git.geoff@infradead.org>
References: <cover.1464286518.git.geoff@infradead.org>
 <aada378f523bb232ae4d0a23e09dc07c0aff40f0.1464286518.git.geoff@infradead.org>
Message-ID: <CA+TH9Vmi1QiKPtvCL07E_1QmmN0YVfpMffYETFZeO0RJuV3icg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Geoff, Thomas,

2016-05-26 20:21 GMT+02:00 Geoff Levand <geoff@infradead.org>:
> The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
> set, build in cgo support for any go programs that may need it.  Note that
> any target package needing cgo support must include
> 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
>
> Fixes build errors like these:
>
>   error: #warning requested reentrant code
>
>   http://autobuild.buildroot.net/results/42a8d07101d8d954511d1c884ecb66e8d861899e
>
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/go/go.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 090c5e4..095c318 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -44,6 +44,16 @@ HOST_GO_TARGET_ENV = \
>         CXX=$(TARGET_CXX) \
>         GOTOOLDIR="$(HOST_GO_TOOLDIR)"
>
> +# The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
> +# set, build in cgo support for any go programs that may need it.  Note that
> +# any target package needing cgo support must include
> +# 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
> +ifeq (BR2_TOOLCHAIN_HAS_THREADS,y)
> +       HOST_GO_CGO_ENABLED = 1
> +else
> +       HOST_GO_CGO_ENABLED = 0
> +endif

I think this is buggy and should be something like that:

-ifeq (BR2_TOOLCHAIN_HAS_THREADS,y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)

Unfortunately, when I apply this fix, the package doesn't compile
anymore. This is the build log:

##### Building packages and commands for linux/arm.
runtime/internal/sys
runtime/internal/atomic
runtime
errors
internal/race
sync/atomic
unicode
unicode/utf8
math
container/list
container/ring
crypto/subtle
crypto/internal/cipherhw
internal/nettrace
runtime/cgo
vendor/golang_org/x/crypto/curve25519
encoding
sync
unicode/utf16
# runtime/cgo
gcc: error: unrecognized command line option '-marm'
image/color
vendor/golang_org/x/crypto/poly1305
internal/syscall/windows
internal/syscall/windows/registry
internal/syscall/windows/sysdll
runtime/race
cmd/compile/internal/test
cmd/vet/internal/whitelist
syscall
io
internal/singleflight
image/color/palette
hash
crypto/cipher
runtime/trace
bytes
strings
hash/adler32
hash/crc32
crypto/hmac
hash/crc64
hash/fnv
strconv
math/rand
math/cmplx
bufio
text/tabwriter
vendor/golang_org/x/text/transform
path
html
reflect
crypto
crypto/aes
crypto/rc4
encoding/base64
encoding/ascii85
encoding/base32
crypto/sha512
crypto/md5
crypto/sha1
crypto/sha256
image
internal/syscall/unix
time
image/internal/imageutil
image/draw
image/jpeg
os
os/signal
fmt
encoding/binary
sort
regexp/syntax
path/filepath
compress/bzip2
container/heap
encoding/pem
runtime/debug
cmd/internal/sys
crypto/des
vendor/golang_org/x/crypto/chacha20poly1305/internal/chacha20
vendor/golang_org/x/crypto/chacha20poly1305
io/ioutil
cmd/internal/dwarf
flag
log
debug/dwarf
compress/flate
debug/gosym
debug/plan9obj
cmd/vendor/golang.org/x/arch/arm/armasm
cmd/vendor/golang.org/x/arch/ppc64/ppc64asm
cmd/vendor/golang.org/x/arch/x86/x86asm
regexp
cmd/internal/obj
archive/tar
compress/zlib
archive/zip
compress/gzip
compress/lzw
context
math/big
debug/elf
debug/macho
debug/pe
encoding/hex
database/sql/driver
encoding/csv
encoding/gob
cmd/internal/goobj
encoding/json
encoding/xml
database/sql
vendor/golang_org/x/net/http2/hpack
vendor/golang_org/x/net/idna
vendor/golang_org/x/text/unicode/norm
cmd/internal/objfile
vendor/golang_org/x/text/width
crypto/dsa
crypto/elliptic
encoding/asn1
cmd/addr2line
crypto/rand
mime
mime/quotedprintable
crypto/rsa
crypto/ecdsa
crypto/x509/pkix
net/http/internal
net/url
go/token
text/template/parse
os/exec
text/scanner
image/gif
go/scanner
go/constant
image/png
index/suffixarray
internal/pprof/profile
testing
internal/trace
go/ast
net/internal/socktest
testing/iotest
testing/quick
text/template
cmd/internal/obj/arm
cmd/internal/obj/arm64
cmd/internal/obj/mips
cmd/internal/obj/ppc64
internal/testenv
cmd/internal/obj/s390x
go/parser
go/printer
runtime/pprof/internal/protopprof
cmd/internal/obj/x86
runtime/pprof
go/doc
html/template
testing/internal/testdeps
cmd/asm/internal/flags
go/types
cmd/asm/internal/lex
go/format
cmd/internal/bio
go/build
cmd/cgo
cmd/compile/internal/syntax
cmd/internal/gcprog
cmd/internal/browser
cmd/dist
cmd/fix
cmd/gofmt
cmd/asm/internal/arch
cmd/compile/internal/ssa
cmd/asm/internal/asm
cmd/cover
cmd/doc
cmd/link/internal/ld
cmd/asm
cmd/nm
cmd/objdump
cmd/pack
cmd/pprof/internal/plugin
go/internal/gccgoimporter
go/internal/gcimporter
cmd/api
cmd/pprof/internal/report
cmd/pprof/internal/svg
cmd/pprof/internal/tempfile
cmd/pprof/internal/symbolizer
go/importer
cmd/pprof/internal/symbolz
cmd/vet/internal/cfg
cmd/vet
cmd/pprof/internal/commands
cmd/pprof/internal/driver
cmd/link/internal/arm
cmd/link/internal/arm64
cmd/link/internal/amd64
cmd/link/internal/mips
cmd/link/internal/mips64
cmd/link/internal/ppc64
cmd/link/internal/s390x
cmd/link/internal/x86
cmd/link
cmd/compile/internal/gc
cmd/compile/internal/amd64
cmd/compile/internal/arm
cmd/compile/internal/arm64
cmd/compile/internal/mips
cmd/compile/internal/mips64
cmd/compile/internal/ppc64
cmd/compile/internal/s390x
cmd/compile/internal/x86
cmd/compile
package/pkg-generic.mk:234: recipe for target
'/media/angelo/WD/data/BUILDROOT/br_qemu_arm/build/host-go-1.8.3/.stamp_built'
failed
make[1]: *** [/media/angelo/WD/data/BUILDROOT/br_qemu_arm/build/host-go-1.8.3/.stamp_built]
Error 2


Geoff, have you any advice on how to debug the go build process?
Unfortunately, I've not found anything like a log file that could help
me.

Sincerely, Angelo



> +
>  # The go build system doesn't have the notion of cross compiling, but just the
>  # notion of architecture.  When the host and target architectures are different
>  # it expects to be given a target cross compiler in CC_FOR_TARGET.  When the
> @@ -60,7 +70,7 @@ HOST_GO_MAKE_ENV = \
>         GOARCH=$(GO_GOARCH) \
>         $(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
>         GOOS=linux \
> -       CGO_ENABLED=1 \
> +       CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
>         CC=$(HOSTCC_NOCCACHE)
>
>  HOST_GO_TARGET_CC = \
> --
> 2.5.0
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
