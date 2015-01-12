From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Mon, 12 Jan 2015 21:42:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix hard float error
In-Reply-To: <20150112123342.5b5a616c@free-electrons.com>
References: <1421010259-10281-1-git-send-email-jkrause@posteo.de>
 <20150112123342.5b5a616c@free-electrons.com>
Message-ID: <1421095338.1971.1.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mo, 2015-01-12 at 12:33 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Sun, 11 Jan 2015 22:04:19 +0100, J?rg Krause wrote:
> 
> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > index ad598d9..3389c3c 100644
> > --- a/package/nodejs/nodejs.mk
> > +++ b/package/nodejs/nodejs.mk
> > @@ -56,14 +56,16 @@ else ifeq ($(BR2_mipsel),y)
> >  NODEJS_CPU = mipsel
> >  else ifeq ($(BR2_arm),y)
> >  NODEJS_CPU = arm
> > -# V8 needs to know what floating point ABI the target is using.  There's also
> > -# a 'hard' option which we're not exposing here at the moment, because
> > -# buildroot itself doesn't really support it at present.
> > +# V8 needs to know what floating point ABI the target is using.
> > +ifeq ($(BR2_ARM_EABIHF),y)
> > +NODEJS_ARM_FP = hard
> > +else
> >  ifeq ($(BR2_SOFT_FLOAT),y)
> >  NODEJS_ARM_FP = soft
> >  else
> >  NODEJS_ARM_FP = softfp
> > -endif
> > +endif # BR2_SOFT_FLOAT
> > +endif # BR2_ARM_EABIHF
> >  endif
> 
> Why don't we simply do:
> 
> NODEJS_ARM_FP = $(BR2_GCC_TARGET_FLOAT_ABI)

Nice, I one-liner :-) Didn't know about BR2_GCC_TARGET_FLOAT_ABI, but
it's exactly what we need. I submit a second version soon.

Best regards
J?rg
