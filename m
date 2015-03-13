From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2015 23:44:58 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/softether: Fix iconv-related
	compile error
In-Reply-To: <87h9toftj3.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 13 Mar 2015 22:59:28 +0100")
References: <1426107668-9110-1-git-send-email-bernd.kuhls@t-online.de>
 <8761a7jhks.fsf@dell.be.48ers.dk> <E1YWVYR-0003aC-Bb@fli4l.lan.fli4l>
 <87h9toftj3.fsf@dell.be.48ers.dk>
Message-ID: <87d24cfrf9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> [posted and mailed]

 >> Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org> wrote in 
 >> news:8761a7jhks.fsf at dell.be.48ers.dk:

 >>> > -ifeq ($(BR2_ENABLE_LOCALE),)
 >>> > +ifeq ($(BR2_PACKAGE_LIBICONV),y)
 >>> 
 >>> Hmm, what does this really change? LIBICONV=y if !BR2_ENABLE_LOCALE, so
 >>> these should be equivalent, right?

 >> Hi,

 >> I am not sure if I understood your question correctly. Currently libiconv is 
 >> only taken into account as dependency if BR2_ENABLE_LOCALE=y, but it is also 
 >> possible to have BR2_PACKAGE_LIBICONV=y if !BR2_ENABLE_LOCALE, just as you 
 >> said.

Ehh, no - libiconv can only be enabled if !BR2_ENABLE_LOCALE, and
softether selects it (if !BR2_ENABLE_LOCALE), so BR2_PACKAGE_LIBICONV is
guanteed to be =y if !BR2_ENABLE_LOCALE, so the two checks are identical
(notice it checks for !locale, not for locale).

 >> But the current code in buildroot git and my patched code do not 
 >> function the same because the current git code ignores libiconv and leads to 
 >> autobuild errors like these from today:

 >> http://autobuild.buildroot.net/results/182/182e658723d654d45c683dc2bc0b959c82
 >> c37826/
 >> http://autobuild.buildroot.net/results/1e4/1e4af4642691ea9681b39eb1ce4f8107e8
 >> c3ff5f/

So I guess that is about the LIBS+= changes instead?

From a quick test I don't seem to be able to reproduce these build
issues though :/

-- 
Bye, Peter Korsgaard
