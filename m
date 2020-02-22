From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Feb 2020 00:48:38 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20200220034343.2370e4e4@windsurf>
References: <20200219074844.F3D6C85D78@fraxinus.osuosl.org>
 <20200220034343.2370e4e4@windsurf>
Message-ID: <93002ccc-73ca-d4ff-81d9-bf524a16840a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 20/02/2020 ? 03:43, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Wed, 19 Feb 2020 07:48:39 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>>     master   | 92  | 67  |  0  | 159 |
> 
> These results are not really good, so we need to put some effort into
> reducing the number of build failures in the autobuilders. See below
> for an analysis of the different build failures. Your help is
> appreciated to fix those issues.
> 

> 
>>     arm      |           efl-1.22.3           | NOK | http://autobuild.buildroot.net/results/4d7861fd5908c59546de19f6af3c27d061fed60b |     
> 
> /data/buildroot/buildroot-test/instance-0/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:39:22: error: expected ',' or '...' before '&&' token
> 
> Some C++ mess it seems. Romain, any idea ?

This is an issue related to poppler dependency that is built with C++11 standard:

sysroot/usr/include/poppler/cpp/poppler-page.h:70:10:
 "error: 'unique_ptr' in namespace 'std' does not name a template type"

But with this toolchain based on gcc-5, the default C++ standard is gnu++98 [2].

The efl libraries should be built with -std=c++11 in CFLAGS (see [1] for similar
issue).

Or maybe we should bump the poppler's package gcc dependency (gcc 5 to gcc 6)
[3]. Doing so, the C++ standard for poppler and efl are the same (C++14).

Otherwise, I don't see how the efl package can know the C++ standard to use.

[1]
https://git.buildroot.net/buildroot/commit/?id=995fb9a4ebca3acb5dc6eb22edee039b67bf5303

[2] https://gcc.gnu.org/gcc-6/changes.html

[3]
https://git.buildroot.net/buildroot/tree/package/poppler/Config.in?h=2020.02-rc1#n7

Best regards,
Romain

> Thomas
> 
