From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Oct 2014 10:11:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-23
In-Reply-To: <CAMo8BfKK1=DZF09GJMa__rw=z-i3pzMhNGy+pfY49f-PtKcZCQ@mail.gmail.com>
References: <20141024063016.0D21A1014BF@stock.ovh.net>
 <CAMo8BfKK1=DZF09GJMa__rw=z-i3pzMhNGy+pfY49f-PtKcZCQ@mail.gmail.com>
Message-ID: <20141024101151.44021dc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Fri, 24 Oct 2014 11:48:51 +0400, Max Filippov wrote:

> This fails because BR2_PREFER_STATIC_LIB is defined and the package
> treats it the old way. I'll send a patch that adds dependency on
> ! BR2_PREFER_STATIC_LIB to aircrack-ng.

Hum, when you grep through the code, it only uses dlopen() if used with
Cygwin:

$ grep -r dlopen *
src/osdep/cygwin.c:		lib = dlopen(file, RTLD_LAZY);

Maybe it's one of the dependencies that need -ldl ? But indeed, doing:

AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
        $(if $(BR2_PREFER_STATIC_LIB),-ldl -lpthread)

is quite silly. How can you have -ldl if you're using static libraries.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
