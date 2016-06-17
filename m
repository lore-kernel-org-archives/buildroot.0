From: Ben Boeckel <mathstuf@gmail.com>
Date: Fri, 17 Jun 2016 01:21:23 +0000 (UTC)
Subject: [Buildroot] Analysis of build results for 2016-05-16
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <njvjaj$gnv$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for the delay; had been on vacation and am catching up on things.

On Tue, 17 May, 2016 at 13:36:11 GMT, Thomas Petazzoni wrote:
>>          arc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/67f574af0cc4348ffe2bce026c44766e49c29124/
>
> Forgets to link with pthread. Ben, since you added this package, can
> you have a look?

So I took the config file pointed there and built taskd with it using
git master as of yesterday. It looks like a problem with how taskd is
linking to gnutls:

    gnutls_compress.c:(.text+0x480): undefined reference to `inflate'

and lots of other missing symbols from libgnutls.a (looks to be similar
for libuuid.a).

Since everything is static, taskd needs to link to gnutls' transitive
dependencies, but CMake's FindGnuTLS module only finds the library
itself, so the final executable ends up with missing symbols.

I'll look into improving CMake's FindGnuTLS for this. The code for
linking to libuuid in taskd seems to have similar problems.

--Ben
