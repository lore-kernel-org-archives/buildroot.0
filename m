From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 13 Oct 2015 08:14:59 +0300
Subject: [Buildroot] [PATCH v2] qt: fix build for arm with
	BR2_STATIC_LIBS
In-Reply-To: <87io6baklj.fsf@dell.be.48ers.dk>
References: <1444128975-17943-1-git-send-email-alexander.lukichev@gmail.com>
 <1444201366-354-1-git-send-email-alexander.lukichev@gmail.com>
 <87io6baklj.fsf@dell.be.48ers.dk>
Message-ID: <CAAHaz6HzXQ+nVp7yg56r=8w7HQcv6BAMtzfxrZ-SNuLM4C0==A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 10/12/2015 11:38 PM, Peter Korsgaard wrote:
>>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:
>
>  > Some Buildroot-generated static toolchains for ARM do not have
>  > dlfcn.h header, which breaks builds of qt-4.8.7 because its
>  > QtCore's plugin loader expects this header to be present (and
>  > dynamic libraries to be supported). For certain platforms without
>  > dynamic libraries, there is a QT_NO_DYNAMIC_LIBRARY constant
>  > defined in plugin loader's source. This patch puts that constant
>  > into Qt's build environment if Buildroot is configured without
>  > shared library support.
[...]
>  > +ifeq ($(BR2_STATIC_LIBS),y)
>  > +QT_CONFIGURE_OPTS += -D QT_NO_DYNAMIC_LIBRARY
>
> Hmm, shouldn't this be checking BR2_PACKAGE_QT_STATIC instead?

I think, no. If BR2_PACKAGE_QT_STATIC means to compile only Qt
statically. The problem is when the whole platform is built with
static libraries (BR2_STATIC_LIBS). Then loading plugins dynamically
is not possible in principle. When the Buildroot build is not static,
some dynamic libraries (e.g., compiled later) may be put onto the
target system and be loaded by Qt, even if it itself is statically
built. Correct me if I'm wrong but I have not been able to confirm
that static Qt cannot load / work with dynamic libraries.

--
Best regards,
  Alexander Lukichev
