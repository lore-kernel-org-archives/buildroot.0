From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Sep 2016 21:26:59 +0200
Subject: [Buildroot] CMAKE_SYSROOT issue [was: Re: [PATCH]
 toolchain-external: fix potential entire root filesystem removal]
In-Reply-To: <878tuscjlr.fsf@dell.be.48ers.dk>
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
 <fc0a0de7-398a-8b83-cf76-c4c0b031e01a@mind.be>
 <87y42tc4fl.fsf@dell.be.48ers.dk>
 <a4cc525b-c26a-fb0d-23c5-c72482377e95@mind.be>
 <87lgysdflp.fsf@dell.be.48ers.dk>
 <cb88e552-39e6-81fd-bf4f-b80d7cb59b7e@mind.be>
 <878tuscjlr.fsf@dell.be.48ers.dk>
Message-ID: <20160921192659.GD3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-09-16 10:52 +0200, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 15-09-16 23:21, Peter Korsgaard wrote:
>  >>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  >> >> >  But nothing is really screaming that it should be included.
>  >> >> 
>  >> >> Ok. We should probably figure out if we need to revert the CMAKE_SYSROOT
>  >> >> addition (e8c3755676) and include that if needed.
>  >> 
>  >> >  Er, why would we need to revert it? Did I miss something?
>  >> 
>  >> I thought it had been discussed on the list, but apparently not. We got
>  >> a report on IRC (I unfortunately don't have logs) that builds of custom
>  >> packages using cmake were failing with 2016.08. It is apparently caused
>  >> by CMAKE_SYSROOT transforming -I$STAGING_DIR/usr/include into --sysroot
>  >> $STAGING_DIR -I /usr/include. In 2016.08 we now default
>  >> BR2_COMPILER_PARANOID_UNSAFE_PATH to y, so it complains about it.
> 
>  >  OK, I found it in my logs:
> 
> Thanks!
> 
>  >> [02/09 11:17:31] <smartin> cmake seems to split it like this:
>  >> '--sysroot <STAGING_DIR> -I/urs/include' , i guess cmake does it
>  >> because of/based on the CMAKE_SYSROOT.
>  >> [02/09 11:17:57] <smartin> ^^^ is to be confirm with cmake developers
>  >> [02/09 11:18:45] <smartin> but i wonder why it keep '-I/usr/include'
>  >> since it is a standard location that gcc will check anyway
>  >> [02/09 11:19:02] <smartin> ^^^ also, to be figured out with cmake developers
> 
> Samuel, did you hear back from the cmake devs?

From what I recal, there was no issue with our cmake infra as it is now.

The problem lies in websocketpp's CMakeList.txt which is incorrect and
forcefully adds /usr/include.

I even sent a PR upstream to fix the issue:

    https://github.com/zaphoyd/websocketpp/pull/578

Unfortunately, it seems the websocketpp hasn't had any activity since
last February: no commit, no PR review, no comment on issues...

But there is now a patch that Pieter can use when he submits
websocketpp.

So, after discussing the issue on IRC with Samuel, I believe this is a
non-issue in our infra.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
