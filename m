From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 12:24:53 +0200
Subject: [Buildroot] [PATCH v2] build: fix umask test
In-Reply-To: <20160531095913.GA27305@airbook> (Kurt Van Dijck's message of
 "Tue, 31 May 2016 11:59:13 +0200")
References: <20160531074622.GB26685@airbook>
 <20160531115326.5b360fcb@free-electrons.com>
 <20160531095913.GA27305@airbook>
Message-ID: <87pos2zfre.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

 >> > --- a/Makefile
 >> > +++ b/Makefile
 >> > @@ -26,7 +26,7 @@
 >> >  
 >> >  # Trick for always running with a fixed umask
 >> >  UMASK = 0022
 >> > -ifneq ($(shell umask),$(UMASK))
 >> > +ifneq (00$(shell umask | sed -e "s/^0*//g"),$(UMASK))
 >> 
 >> Doesn't this makes the assumption that "umask" will always return a
 >> value that starts with two zeros ?

 > No.
 > the "umask | sed -e ..." strips leading 0's, when present.
 > "00$(...)" glues 00 in front of the stripped umask, so it is compatible
 > again.

True. I still think moving the SHELL= line to the very top of the file
is a safer/cleaner approach, so the same shell is used everywhere in
Buildroot.

-- 
Bye, Peter Korsgaard
