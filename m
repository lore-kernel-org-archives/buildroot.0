From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 9 Mar 2016 11:40:22 -0300
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <56E03522.8060609@mind.be>
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
 <87a8m721lk.fsf@dell.be.48ers.dk> <56E02D83.9020402@zacarias.com.ar>
 <871t7j205g.fsf@dell.be.48ers.dk> <56E03522.8060609@mind.be>
Message-ID: <56E035D6.2090701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/16 11:37, Arnout Vandecappelle wrote:

>> Yes, that's basically what I'm saying +/- the question if you want to
>> rely on $0 containing the full path to the wrapper or if you use
>> /proc/self/exe instead.
>
>   $0 will always contain the full relative path to the wrapper, no? Even
> if it was found through PATH, the PATH search is done by libc so the
> shell will be invoked with the full (absolute or relative) path to the
> wrapper and use that as $0. Or am I missing something?
>
>   I think the /proc/self/exe thing was something to deal with symlinks,
> which isn't the issue here.

Indeed, take the following example:

---
#!/bin/sh

TUPLE=powerpc-buildroot-linux-uclibcspe
WRAPPER_DIR=$(dirname $0)
STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../${TUPLE}/sysroot)

echo Invocation: $0
echo Wrapper dir: $WRAPPER_DIR
echo Staging dir: $STAGING_DIR
---

Run full pathspec /home/gustavoz/b/router03/output/host/usr/bin/ja:

Invocation: /home/gustavoz/b/router03/output/host/usr/bin/ja
Wrapper dir: /home/gustavoz/b/router03/output/host/usr/bin
Staging dir: 
/home/gustavoz/b/router03/output/host/usr/powerpc-buildroot-linux-uclibcspe/sysroot

Run in-place ./ja:

Invocation: ./ja
Wrapper dir: .
Staging dir: 
/home/gustavoz/b/router03/output/host/usr/powerpc-buildroot-linux-uclibcspe/sysroot

We can add a check to see if ${STAGING_DIR} is defined on and avoid 
(re)setting it when it is.

if [ -z ${STAGING_DIR} ]; then magic; fi

Regards.
