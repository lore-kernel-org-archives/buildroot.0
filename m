From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 10:55:37 +0100
Subject: [Buildroot] [PATCH v2 23/23] toolchain-external: introduce and
 use external toolchain infra
In-Reply-To: <db5e7d52-3abe-a74b-ee86-06d60a9491d9@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-24-git-send-email-romain.naour@gmail.com>
 <28350dcb-4c46-22ce-63aa-5d4ff8902b47@gmail.com>
 <20161101142314.7248d448@free-electrons.com>
 <db5e7d52-3abe-a74b-ee86-06d60a9491d9@gmail.com>
Message-ID: <20161102105537.69bd0a55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Nov 2016 18:42:22 +0100, Romain Naour wrote:

> >  - The Linaro toolchain is EABIhf, the Sourcery toolchain is EABI, so
> >    there is never a choice between Linaro and Sourcery for a given
> >    target configuration.  
> 
> Ok for this one but my concern was about Sourcery over Arago ARM toolchains and
> Sourcery over Codescape MIPS toolchains. Notice that Linaro provide an EABI
> toolchains [1], if someone add this toolchain in Buildroot we will have a choice
> between Linaro and Sourcery toolchains.

OK.

> My understanding is: currently we have a list of "preferred" toolchains with a
> fall back to custom toolchains. So even if we want to keep toolchains sorted
> alphabetically here, we have to make an exception for toolchain-external-custom
> package.

Correct, the "custom" option should definitely be the last one, we
prefer to use pre-defined toolchains when available.

> >  - The Arago toolchain is indeed old, and I'd rather not use it for our
> >    default on ARM. Maybe we can keep an alphabetic ordering, and add a
> >    "default" Config.in clause in the choice...endchoice? Yes, it is
> >    weird to have such a default in the generic code, but I don't see
> >    another option.  
> 
> I guess you don't really like the patch 24/24 of the last series (v3):
> http://patchwork.ozlabs.org/patch/689378/

So, in fact we have two choice:

 (1) Play with the "source" order, to get some toolchains considered as
     the default choice over other toolchains. This is what your patch
     24/24 currently does.

     Advantage is that we don't have to maintain a list of "default"
     statement. The only drawback is that we violate the rule of "let's
     include by alphabetic ordering".

 (2) Add a potentially long list of "default" statement. This solution
     is painful IMO, and its only advantage is that we don't violate
     the "order alphabetically" rule.

So despite what Yann said, I'm in fact going to propose that we stick
with (1), i.e what your patch does currently. Yes, it's a violation of
the "order alphabetically" rule, but it's the easiest solution, and is
probably explained by comments in your patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
