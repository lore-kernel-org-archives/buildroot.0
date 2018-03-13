From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 09:28:49 +0100
Subject: [Buildroot] [PATCH] cmake: Fix RPATH for host libraries built
 by CMake
In-Reply-To: <ef04ec321632c14eb54ccc7bbd3638d60f602d3e.1520880682.git.jan.kundrat@cesnet.cz>
 ("Jan =?utf-8?Q?Kundr=C3=A1t=22's?= message of "Mon, 12 Mar 2018 19:41:00
 +0100")
References: <ef04ec321632c14eb54ccc7bbd3638d60f602d3e.1520880682.git.jan.kundrat@cesnet.cz>
Message-ID: <876060fkfy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Kundr?t <jan.kundrat@cesnet.cz> writes:

 > The host shared libraries produced by CMake were missing a proper
 > DT_RPATH. That became a problem because the DT_RPATH handling is not
 > transitive by design.

 > Consider the following scenario:

 > - pkg-a provides a library (`liba`) which links to `libpcre`
 > - pkg-b provides a binary (`foo`) and a shared library (`libb`) which is
 > needed by that binary
 > - `libb` links to `liba`
 > - pkg-a and pkg-b are both built by CMake

 > In this scenario, `foo` is correctly marked with DT_RPATH pointing to
 > host/lib/, but that path is not used when (recursively) resolving PCRE's
 > symbols in `liba`. When attempting to run the `foo` binary, the linker
 > correctly finds both `liba` and `libb`, but it cannot find the
 > libpcre.so as built by Buildroot for host.

 > Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Committed, thanks.

-- 
Bye, Peter Korsgaard
