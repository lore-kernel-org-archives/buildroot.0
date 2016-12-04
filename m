From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 4 Dec 2016 19:08:45 +0100
Subject: [Buildroot] [PATCH 1/9] skalibs: new package
In-Reply-To: <20160809221532.3f36d369@itchy>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1470690140-18803-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20160809100622.4b18f1c7@free-electrons.com>
 <20160809221532.3f36d369@itchy>
Message-ID: <20161204180845.GA19204@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-08-09 22:15:32, Eric Le Bihan wrote:
> Hi!
>
> Le Tue, 9 Aug 2016 10:06:22 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>
> > On Mon,  8 Aug 2016 23:02:12 +0200, Eric Le Bihan wrote:

[...]

> > > + trytypesize() {
> > > +   echo "Checking size of $3..."
> > > +-  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o
> > > trysizeof$1 src/sysdeps/trysizeof$1.c +-
> > > type_size=$(./trysizeof$1) || fail "$0: unable to determine size of
> > > $3" ++  r=false ++  type_size=0
> > > ++  while true; do
> > > ++    cat<<EOF>trysizeof$1.c
> > > ++#include <sys/types.h>
> > > ++
> > > ++int main(void)
> > > ++{
> > > ++  static int v = 1 / !!((sizeof($3) == $type_size));
> > > ++  return 0;
> > > ++}
> > > ++EOF
> > > ++    if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o
> > > trysizeof$1 trysizeof$1.c 2>/dev/null; then ++        r=true
> > > ++        break
> > > ++    fi
> > > ++    type_size=$(expr $type_size + 1)
> > > ++    test $type_size -le 16 || break
> > > ++  done
> > > ++  test $r = true || fail "$0: unable to determine size of $3"
> > > +   type_bits=$(expr 8 \* $type_size)
> > > +-  rm -f trysizeof$1
> > > ++  rm -f trysizeof$1 trysizeof$1.c
> > > +   echo "sizeof$1: $type_size" >> $sysdeps/sysdeps
> > > +   echo "#define ${package_macro_name}_SIZEOF$2 $type_size" >>
> > > $sysdeps/sysdeps.h
> > > +   echo "#define ${package_macro_name}_$2_BITS $type_bits" >>
> > > $sysdeps/sysdeps.h
> >
> > Instead of doing this loop to find the size of the different types,
> > what about using the following compiler pre-built defines (like you're
> > doing for little endian vs. big endian detection below) :
> >
> > $ sparc-linux-gcc -dM -E - </dev/null | grep SIZEOF
> > #define __SIZEOF_INT__ 4
> > #define __SIZEOF_POINTER__ 4
> > #define __SIZEOF_LONG__ 4
> > #define __SIZEOF_LONG_DOUBLE__ 16
> > #define __SIZEOF_SIZE_T__ 4
> > #define __SIZEOF_WINT_T__ 4
> > #define __SIZEOF_PTRDIFF_T__ 4
> > #define __SIZEOF_FLOAT__ 4
> > #define __SIZEOF_SHORT__ 2
> > #define __SIZEOF_WCHAR_T__ 4
> > #define __SIZEOF_DOUBLE__ 8
> > #define __SIZEOF_LONG_LONG__ 8
>
> I did not know about this. Thanks for the suggestion. I'll rework the
> patch.

I've done some tests: the preprocessor solution is OK for C types like
'unsigned short' and co, but it does not work for some system types like
gid_t and time_t. So I'll keep the loop based solution in my upcoming
respin of this series.

Best regards,

--
ELB
