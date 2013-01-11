From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Jan 2013 13:53:02 +0100
Subject: [Buildroot] pkg-generic.mk question
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C610B9E3A3@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C610B9E3A3@ex-mb1.corp.adtran.com>
Message-ID: <50F00B2E.5080900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/10/13 19:58, ANDY KENNEDY wrote:
> All,
>
> Consider the following (from pkg-generic.mk):
>
> define inner-generic-package
>
> <snip>
>
> $(2)_TYPE                       =  $(5)
>
> <snip>
>
> $(2)_DIR        =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
>
>
> The<PKG>_TYPE is set to "$" (5), however, the<PKG>_DIR is set to
> "$$" (BUILD_DIR)/$$<the rest>.  My question is why the need for the $$
> for BUILD_DIR?  I THINK I understand the reason for the
> $$($(2)_BASE_NAME):  The eval will boil this down to $(<PKG>_BASE_NAME),
> which will the get POST interrupted AFTER<PKG>_BASE_NAME is assigned
> LATER, right?
>
> But, I'm confused as to the reason for the $$(BUILD_DIR).  It is
> assigned well before the reading of this file and is essentially a
> static variable.

  AFAICS, there is no specific reason to do that, except for consistency. 
It is quite difficult to understand what is hapening with these make 
functions, and things become easier if you just follow the rule: 
everything should be $$(...), except for the function arguments.

  Note that the real question should be: why is $$(...) used for 
BUILD_DIR, but $(...) for the patsubst in $(2)_RAWNAME? Because that 
really is inconsistent.

  A potential reason to really use $$ instead of $ is to allow for late 
evaluation. It makes it possible, for instance, to override the BUILD_DIR 
in a rule variable.


  Regards,
  Arnout


>
> NOTE:  This question is for my own edification and learning.  I'm not
> questioning the ability/logic of this Makefile as I know it works
> perfectly.  I'm attempting to do something similar in a Makefile of my
> own.
>
> Thanks in advance for the information!
>
> Andy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
