From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2011 09:34:12 +0200
Subject: [Buildroot] [PATCH 1/2] package: instrument to gather timing
 data
In-Reply-To: <201110110759.23066.arnout@mind.be>
References: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
 <0cbf021419332c37bd77e661c97cfc881329f1bb.1318176666.git.thomas.petazzoni@free-electrons.com>
 <201110110759.23066.arnout@mind.be>
Message-ID: <20111011093412.06546b5a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 11 Oct 2011 07:59:22 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On Sunday 09 October 2011 18:17:27, Thomas Petazzoni wrote:
> > Instrument the package infrastructure to generate a
> > $(O)/build-time.data file which contains one line for each step of
> > each package and the corresponding duration in milliseconds.
> > 
> > The instrumentation is not perfect yet, as it doesn't account for
> > packages with overriden source directory 
> 
>  Why is that relevant?

With an overidden source directory, the step of steps are different:
instead of download, extract, patch, configure, etc., it's rsync,
configure, etc.

>  The output goes to $(O) anyway.  But this makes me 
> think: wouldn't it be better to 

To ? :-)

>  I would call that a feature :-)  Partial builds typically mean that you're 
> hacking away at some package, and then it's very relevant to see the impact on 
> build time.

Ok.

>  Of course, there would need to be a target buildtime-clean that removes the 
> files.

Why not, yes.

> > +define outputtime
> > +       newtime=`echo $$(($$(date +%s%N)/1000000))` ; \
> > +       oldtime=`cat $(O)/.br.time` ; \
> > +       rm -f .br.time	      ; \
> > +       timediff=$$(($$newtime-$$oldtime)) ; \
> > +       echo "$(1),$(2),$$timediff" >> $(O)/build-time.data
> 
>  Is there a particular reason to use a make function parameter in a place like 
> this instead of using $($(PKG)_NAME) directly?  I've seen this in other places 
> in buildroot as well...

No, I guess I could use $($(PKG)_NAME) directly.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
