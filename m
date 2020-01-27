From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jan 2020 14:31:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: use system-icu for
 host-nodejs when available
In-Reply-To: <CADvTj4obi4rGU8vhk4qONmxbb3ADxK4gUnbAYvro1PcC61f=Zw@mail.gmail.com>
References: <20200127005539.125369-1-james.hilliard1@gmail.com>
 <20200127105951.11716eea@windsurf>
 <CADvTj4obi4rGU8vhk4qONmxbb3ADxK4gUnbAYvro1PcC61f=Zw@mail.gmail.com>
Message-ID: <20200127143111.0f60a43d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jan 2020 03:31:54 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Hmm, well it seemed to work fine with a full rebuild with and without host-icu
> I looked at that commit which is apparently fixing this issue:
> http://autobuild.buildroot.net/results/a1f5e336ddaf386ba08eb5a7a299a48e2bdfe2d9/build-end.log
> however that log is from a much older version of nodejs(10.16.3) build so
> I'm assuming some of the node build system changes eliminated the issue
> since I wasn't able to reproduce the build failure with the current 12.14.1.

"It builds for you" doesn't mean it is correct. The build issue we had
only occurred on machines that don't have OpenSSL installed
system-wide, which is unlikely to be the case on your system. The issue
was that the host tools built by NodeJS did not had a RPATH defined,
and therefore when executed they didn't know they should use the
OpenSSL library installed in $(HOST_DIR)/lib.

In machines that had a close enough version of OpenSSL installed
system-wide, it was not visible, as those host tools were happily using
the system-wide OpenSSL. But in the general case, it doesn't work.

So, no "it builds for me" is not sufficient. We need to ensure that the
host tools installed by host-nodejs do have a correct RPATH.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
