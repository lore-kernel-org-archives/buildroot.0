From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Feb 2014 18:49:19 +0100
Subject: [Buildroot] [PATCH] vlc: fix some configure options
In-Reply-To: <CAHt8ZCMj+vSa4htd5Q=mbAG=VZq=fpt1s0ubQFP2u4rYQ0FFhA@mail.gmail.com>
References: <1393360566-4849-1-git-send-email-spdawson@gmail.com>
 <87sir6hklp.fsf@dell.be.48ers.dk> <87ob1uhk68.fsf@dell.be.48ers.dk>
 <CAHt8ZCMj+vSa4htd5Q=mbAG=VZq=fpt1s0ubQFP2u4rYQ0FFhA@mail.gmail.com>
Message-ID: <530E291F.2000708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/14 11:11, Simon Dawson wrote:
> Hi Peter,
> 
> On 25 February 2014 23:00, Peter Korsgaard <peter@korsgaard.com> wrote:
>>  > Did you test these?
> 
> Yes, I did.
> 
>> Ahh, now I get it. Our autoreconf somehow converts all those --enable /
>> --disable to --with / --without.
> 
> Yes, exactly so.
> 
>> Anybody that has any idea why this is so? It quite unfortunate as we
>> will have to change all of this back once we bump the vlc version and no
>> longer need VLC_AUTORECONF = YES.
> 
> I haven't yet got to the bottom of how/why this is happening, I'm afraid.

 There's a lot of strangeness caused by our AUTORECONF...

 I guess it has something to do with all the warnings we get when
AUTORECONFing, since in m4/with_pkg.m4 I do see:

m4_case(def_arg,
            [yes],[m4_pushdef([with_without], [--disable-]with_arg)],
            [m4_pushdef([with_without],[--enable-]with_arg)])

AC_ARG_ENABLE(with_arg,
     AS_HELP_STRING(with_without, description[ @<:@default=]def_arg[@:>@]),,
    [AS_TR_SH([enable_]with_arg)=def_arg])


 In other words, it registers an --enable option.

 I guess that the PKG_CHECK_MODULES option implicitly enables a
--with-foo option as well, but doesn't mention it in the help text.


 Regards,
 Arnout

> 
> Simon.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
