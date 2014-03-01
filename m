From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:50:18 +0100
Subject: [Buildroot] Issue with the luarocks infra and legal-info
Message-ID: <20140301165018.2743ec23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

I've discovered an issue with the luarocks package infrastructure that
apparently we didn't notice during its review. The problem is that the
luarocks package infrastructure makes the extract step of a lua package
depend on host-luarocks.

The problem with this is that the legal-info infrastructure does run
the extract step of all packages in order to extract their source code
and get the license files. In the case of luarocks packages, this
triggers the build of host-luarocks, itself triggering the build of
host-lua and the selected lua-interpreter. But lua-interpreter is a
target package, so it depends on the toolchain, so the toolchain is
also built. This is rather annoying for the legal-info make target,
which should be relatively quick and normally not build anything or
only small things.

Is there anything that can be done to improve this? Does host-luarocks
really need to depend on the target lua interpreter?

Thanks in advance for your suggestions,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
