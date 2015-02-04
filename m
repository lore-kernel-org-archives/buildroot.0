From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 04 Feb 2015 21:21:26 +0100
Subject: [Buildroot] board-specific autotools env customization
In-Reply-To: <CAKAx1cg32iH0XEby8hPoQq1nm2DutdtDROE5nBWsXMi1mO93qg@mail.gmail.com>
References: <CAKAx1chT6Grx+oRMiQy5t29TUe=avo6v9CR2nP1GZ6Lf1-a-5A@mail.gmail.com>	<20150202175455.5dd5c2e3@free-electrons.com>	<CAKAx1ciLEADv9bnxzLh-2m9hvuaVUnvWZcKqyGMRwBOaQVhLWQ@mail.gmail.com>	<54D08CB7.7040801@mind.be>
 <CAKAx1cg32iH0XEby8hPoQq1nm2DutdtDROE5nBWsXMi1mO93qg@mail.gmail.com>
Message-ID: <54D27F46.6030704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/15 08:52, Lionel Orry wrote:
> Hi Arnout,
> 
> On Tue, Feb 3, 2015 at 9:54 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

[snip]
>>  So we would really appreciate if you could check the various flags that zeromq
>> tries to run and set them to yes if they are available, and send a patch to the
>> mailing list. I've already checked libzmq_cv_sock_cloexec: SOCK_CLOEXEC was
>> introduced in 2.6.27 so we can also assume that it's always available. Which
>> kernel version do you run?
>>
> 
> I have this list in here (there are 6 flags, 5 of them are available)
> for my compiler, so I could make this patch. It won't do anything
> useful until the acinclude.m4 is patched though, so I suppose the
> first step is to fix acinclude.m4.
> 
> I use a 2.6.32 based kernel.
> 
> For reference, with my current compiler :
> * compiler version : sh4-linux-gcc (GCC) 4.7.3 20130514
> (STMicroelectronics/Linux Base 4.7.3-124)
> * SOCK_CLOEXEC : available
> * SO_KEEPALIVE : available
> * TCP_KEEPCNT : available
> * TCP_KEEPIDLE : available
> * TCP_KEEPINTVL : available
> * TCP_KEEPALIVE : not available

 This indeed seems to correspond to the current situation (kernel > 2.6.30).


>>> Aside note : in fact, in zeromq, the macros written for these flags
>>> detection are wrong because they don't check if the value is set in
>>> environment and always override them; so it is a bad example, but the
>>
>>  Yeah, indeed, you should also patch acinclude.m4 to correctly use a cache
>> variable with AC_CACHE_VAL and AC_CACHE_CHECK. And that patch should be sent
>> upstream of course.
>>
> 
> I totally agree. But I'm still quite bad at autotools stuff and I
> don't know how to use AC_CACHE_xxx macros
> but I'll try to do it anyway. Any hints appreciated, the most clean
> the patch is, the more chances it will have to hit upstream...

The basic pattern is:

AC_CACHE_CHECK(whether SOCK_CLOEXEC is supported, libzmq_cv_sock_cloexec,
[AC_TRY_RUN(...)])

and then of course remove the AC_MSG_CHECKING that comes before it. The cache
variable should be set in the body of the AC_CACHE_CHECK, like it currently is.


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
