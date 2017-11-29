From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 14:34:27 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-25
In-Reply-To: <CAJtjsKbTBDN8zaOOR5FLfC-rXq7WDskvVu-M6Y1sgZzcTTSBog@mail.gmail.com>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
 <20171126152140.0fd3902b@windsurf.home>
 <CAJtjsKZjOxXO=Gu475a+6gP9TR4RrEptaS1MfuHYpdzjbF5Aig@mail.gmail.com>
 <OF3CB5EEB3.059011A8-ON002581E5.004E2384@notes.na.collabserv.com>
 <20171128233028.a7dqd7nmj6q5hf6r@tungsten.ozlabs.ibm.com>
 <CAJtjsKbTBDN8zaOOR5FLfC-rXq7WDskvVu-M6Y1sgZzcTTSBog@mail.gmail.com>
Message-ID: <20171129143427.576f713e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 14:28:55 +0100, Johan Oudinet wrote:

> > I don't have much time at the moment but I'll take a look at this when I
> > can (in a previous life I was an Erlang programmer, it's great to see it
> > as part of buildroot!). It would be sad to disable HiPE so I'll see if
> > we can just bump the version up to 20.
> >
> > Or Johan if you get to it first, I'll certainly test it :-)  
> 
> I haven't had the time to do it yet, however, it seems OTP 20 has
> simply applied the patch I mentioned:
> https://github.com/erlang/otp/pull/1394/commits/024e438101c010f17e3a374117c3b376d48483f3
> 
> If I understand correctly this configure, there is a test in the
> configure to automatically enable HiPE for a list of architectures.
> ppc64 is present in this list but not ppc64le. So, I think HiPE would
> be disabled on ppc64le architectures even if we bump to OTP 20.

Well, if this commit made it to OTP 20, then there is no need to
disable HiPE explicitly: my understanding is that this commit makes
sure ppc64le is not mistaken as ppc64, in particular to avoid having
HiPE being enabled. See https://github.com/erlang/otp/blob/master/erts/configure.in:

if test "$cross_compiling" != "yes" && test X${enable_hipe} != Xno; then
  if test -z "$M4"; then
	enable_hipe=no
   	AC_MSG_NOTICE([HiPE disabled as no valid m4 is found in PATH])
  else
  	case "$ARCH-$OPSYS" in
	    x86-linux|amd64-linux|x86-darwin*|amd64-darwin*|ppc-linux|ppc64-linux|ppc-darwin|arm-linux|amd64-freebsd|x86-freebsd|x86-sol2|amd64-sol2|ultrasparc-linux)
      		enable_hipe=yes
      		;;	
  	esac
  fi
fi

ppc64le used to be handled as ppc64, so it was matching the case
"$ARCH-$OPSYS", and enable_hipe was set to yes.

With ARCH=ppc64le, this will no longer match, and enable_hipe will no
longer be set to yes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
