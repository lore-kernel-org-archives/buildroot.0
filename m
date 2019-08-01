From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 18:29:08 +0200
Subject: [Buildroot] [PATCH 1/1] quagga: fix static build with musl
In-Reply-To: <20181201215953.6966-1-fontaine.fabrice@gmail.com>
References: <20181201215953.6966-1-fontaine.fabrice@gmail.com>
Message-ID: <768c2e48-708f-3bf1-c049-728c90a5841c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 01/12/2018 22:59, Fabrice Fontaine wrote:
> zebra library defines optind and opterr which are already defined in
> libc
> Current code is not included if !defined _LIBC && defined __GLIBC__ &&
>  __GLIBC__ >= 2 && _GNU_GETOPT_INTERFACE_VERSION == GETOPT_INTERFACE_VERSION
> 
> However, this fails on musl even if musl provides getopt as a result
> static linking with musl fails
> 
> To fix this issue, add an option to allow the user to disable getopt
> code and use it in quagga.mk
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/32f93a73379d073abcaf8936ffbb8b5707583024
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 I didn't really like this approach, so I dug into it a little. Turns out that
the real issue is that both quagga's getopt and libc's getopt are pulled in, and
the only reason this happens is because getopt() is called by netsnmp but quagga
itself doesn't define getopt(). However, we can pass an option to do that.

 So I've prepared a patch [1] and marked this one as superseded.

 Can you update your bug report in quagga [2] (even though there was absolutely
no response on it for half a year).

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/1140624/
[2] https://bugzilla.quagga.net/show_bug.cgi?id=1000
