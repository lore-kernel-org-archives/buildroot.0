From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 16:09:15 +0100
Subject: [Buildroot] [PATCH 2 of 3 v2] dependencies: build a host-tar if
 no suitable tar can be found
In-Reply-To: <20111123152440.0fef75ca@skate>
References: <patchbomb.1322053783@devws108>
 <d4b15640ce2d3ab89835.1322053785@devws108>
 <20111123152440.0fef75ca@skate>
Message-ID: <CAAXf6LUQhqvc_-YtztmUknwCV6r0+ixsCD8tUes+L_-GB-owDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 23, 2011 at 3:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 23 Nov 2011 14:59:59 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Some toolchains, like the one built with buildroot itself, use
>> hardlinks (for example to link between the c++ and g++ binary).
>> Unpacking such a toolchain with the --strip-components options does
>> not work correctly if the system tar is too old (<1.17). Even recent
>> releases of RedHat/CentOS still ship with tar 1.15.
>>
>> This patch checks for a suitable tar version (tar 1.17+) on the host
>> system, and adds host-tar to the host dependencies if none can be
>> found.
>>
>> TAR is redefined to HOST_TAR, except when extracting host-tar (this
>> is a chicken-and-egg problem), so that all packages use the host-tar
>> if no suitable tar was found.
>
> I am still puzzled by the fact that tar is needed to extract this
> host-tar, so there's like a chicken-and-egg problem. I understand that
> the real host tar is used to extract the host-tar, which is then use to
> extract all other packages. But that sounds really nasty to me.

To summarize the problem about tar:
* some distributions (like RedHat/CentOS) still ship an old tar
version (1.15) which is known to have problems when
--tar-strip-components is used on tarballs with hardlinks.
* the problem was first seen when tar'ing up a buildroot toolchain and
use it as an external toolchain later.
* since the problem is not restricted to toolchains, we decided to fix
the problem in a common way, by redefining TAR.

I see several solutions, some more desirable than others:
1. don't change anything and force users of RedHat/CentOS to build
their own tar that is recent enough. This is by far the easiest from a
buildroot perspective, but least user-friendly.
2. use the proposed patch
2. don't download tar as .tar.gz/.tar.bz2, but rather as .cpio.gz
(available on the official mirrors since 1.16.1). It requires cpio and
gzip to be present, but that is already checked in dependencies.sh.
We'd need to update gentargets to cater for .cpio, but that is doable.

Best regards,
Thomas
