From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 22:21:52 +0100
Subject: [Buildroot] [PATCH] pkg-generic: Strip all but leading comments
	from C files used as license.
In-Reply-To: <1447779739-4661-1-git-send-email-peda@lysator.liu.se> (Peter
 Rosin's message of "Tue, 17 Nov 2015 18:02:19 +0100")
References: <1447779739-4661-1-git-send-email-peda@lysator.liu.se>
Message-ID: <878u5wcoen.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Rosin <peda@lysator.liu.se> writes:

 > From: Peter Rosin <peda@axentia.se>
 > Signed-off-by: Peter Rosin <peda@axentia.se>
 > ---
 >  package/pkg-utils.mk |   28 +++++++++++++++++++++++++---
 >  1 file changed, 25 insertions(+), 3 deletions(-)

 > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
 > index 44bd2c9..1497eb2 100644
 > --- a/package/pkg-utils.mk
 > +++ b/package/pkg-utils.mk
 > @@ -145,8 +145,30 @@ endef
 
 >  define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
 >  	$(call legal-license-header,$(1),$(2) file,$(4)) && \
 > -	cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
 > -	echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
 >  	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
 > -	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
 > +	case $(3) in \
 > +	*.c|*.h) \
 > +	  sed -e '\
 > +x;\
> +/^$$/{\
 > +  x;\
 > +  /^[ \t]*$$/b;\
 > +  /^[ \t]*\/\//b;\
 > +  /^[ \t]*\/\*.*\*\//b;\

Hmm, I don't think we want to fiddle with the content of the legal
statements. Is there any real problem with having the complete .c / .h
file? That's still helping people but not risking that we screw up
anything.


-- 
Bye, Peter Korsgaard
