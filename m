From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 16:04:18 +0100
Subject: [Buildroot] [PATCH 1/1] cmake: bump version to 3.10.2 and add
 license hash
In-Reply-To: <6AE94196-F3D3-4887-BC12-EDBA8A3A4AA3@gmail.com>
References: <20180213195729.33644-1-markhirota@gmail.com>
 <20180213232538.0441c65a@windsurf.lan>
 <6AE94196-F3D3-4887-BC12-EDBA8A3A4AA3@gmail.com>
Message-ID: <20180214160418.2cf49d57@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Feb 2018 06:48:36 -0800, Mark Hirota wrote:

> Thank you for providing that patchwork link, as it provides excellent
> background on this.  It seems that the build failures you?re
> referring to can only be seen once a change occurs on master?

No, you can reproduce the issue if you build host-cmake in an old
enough system, such as a system that has a host gcc < 4.8.

> Perhaps I should submit a patch for cmake 3.9.6 instead? This is
> because my goal is to have support for LTO the or
> CMAKE_INTERPROCEDURAL_OPTIMIZATION variable.

I'm not familiar with CMake numbering scheme. Isn't 3.8.x and 3.10.x
stable, and 3.9.x development ?

I think the most appropriate approach is instead to make the
->emplace_hint() method call conditional. It is only there to "hint" at
where some element should be placed in a list, and looks like an
optimization. Perhaps it could fallback on something else if
->emplace_hint() is not available.

Alternatively, this ->emplace_hint() is only used in the Ninja backend,
so if the Ninja backend could be conditionally enabled/disabled, it
would allow to disable it when the host gcc is too old.

It's just that IMO it's too early for Buildroot to drop support for
build machines that don't have at least gcc 4.8.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
