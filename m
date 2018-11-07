From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Nov 2018 22:08:54 +0100
Subject: [Buildroot] [PATCH] traceroute: fix 'no rule to make target
 -lm' error
In-Reply-To: <51e4e1aa-c4c8-0353-dbfa-722756a49f71@mind.be> (Arnout
 Vandecappelle's message of "Tue, 6 Nov 2018 00:40:38 +0100")
References: <1539902241-10211-1-git-send-email-sergio.prado@e-labworks.com>
 <20181104114514.523365ee@windsurf> <20181104122638.7103719d@windsurf>
 <19d8f97c-f90d-9a44-6b2b-ad2132aa69af@mind.be>
 <51e4e1aa-c4c8-0353-dbfa-722756a49f71@mind.be>
Message-ID: <878t24bno9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Now, the incorrect dependencies will only affect us in case a Makefile contains
 > a rule like this:

 > foo: -lbar
 > 	$(CC) -o $@ $^

 > because make will expand $^ into the vpath-expanded /usr/lib/libbar.so (assuming
 > we set VPATH to STAGING_DIR, but libbar.so doesn't exist in STAGING_DIR). But in
 > that case, we'll get a link error so that situation will be detected and the
 > Makefile can be patched.

 >  For traceroute, this isn't the case; it has something like:

 > LIBS := -lbar
 > foo: $(LIBS)
 > 	$(CC) -o $@ $(LIBS)

 > so the VPATH override should work.

I still find it a bit strange to list system libraries as dependencies
when the Makefile doesn't have any rules to create/update them, but yeah.


 >  Bottom line: it looks like Sergio's patch is indeed correct, and moreover, it
 > looks like it might be better to add it to TARGET_MAKE_ENV. Note sure if we want
 > to take the risk at this point to make such a landslide change?

I've now committed Sergio's patch with these details added to the
description, thanks for the investigation.

Notice that this particular case could also be fixed by filtering out
-l% from LIBS, just like traceroute already does for -L entries:

LIBDEPS = $(filter-out -L%,$(LIBS))

..

$(TARGET): $(OBJS) $(MOD_OBJS) $(LIBDEPS)
           $(CC) $(LDFLAGS) -o $@ $(OBJS) $(MOD_OBJS) $(LIBS)

-- 
Bye, Peter Korsgaard
