From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 5 Mar 2015 01:03:54 +0100
Subject: [Buildroot] [PATCH] cmake: use system libzma when the xz
 package is enabled
In-Reply-To: <20150304121302.34acc5c6@free-electrons.com>
References: <1425467236-27158-1-git-send-email-fabio.porcedda@gmail.com>
 <20150304121302.34acc5c6@free-electrons.com>
Message-ID: <CAHkwnC_jfQ=a8i45-5TrWqOcYPto48kFHEdg9Vt-J+5SF-hCAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 4, 2015 at 12:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed,  4 Mar 2015 12:07:16 +0100, Fabio Porcedda wrote:
>
>> +ifeq ($(BR2_PACKAGE_XZ),y)
>> + HOST_CMAKE_DEPENDENCIES += host-xz
>> + HOST_CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBLZMA=ON
>> +endif
>
> This doesn't make any sense. Why would a dependency on host-xz be tied
> to the activation of the target xz package ?
Well.. you are damn right!

> You have two choices here:
>
>  * Ask host-cmake to *always* use its internal copy of the xz library,
>    and to never look for a host-installed one.
I have found the problem, the problem is that we add in the
HOST_CFLAGS the  -I$(HOST_DIR)/usr/include, but CMAKE_F_FLAGS are
before the internal -I<dir> in the gcc command line, so the xz headers
was found before the cmake ones.

I will get rid of the -I$(HOST_DIR)/usr/include in the HOST_CFLAGS
before passing it to cmake because we don't want that it uses anything
from it.

>  * Depend on host-xz unconditionally, and ask host-cmake to always use
>    this system-provided host-xz.

Maybe it's not the preferred one?

BR
-- 
Fabio Porcedda
