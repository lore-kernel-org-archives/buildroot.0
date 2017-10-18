From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Oct 2017 19:42:15 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171018133651.0a8ea508@windsurf.home>
References: <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
 <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
 <20171017210354.38d89b3c@windsurf.lan>
 <ff04b0db-d3d5-2314-9d9c-3ead377eb981@mind.be>
 <20171018085748.20a3a9f5@windsurf.home>
 <8dc16ff6-7184-262a-8564-7ab7e43412a1@mind.be>
 <20171018133651.0a8ea508@windsurf.home>
Message-ID: <20171018174215.GB2833@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, Anisse, All,

On 2017-10-18 13:36 +0200, Thomas Petazzoni spake thusly:
> On Wed, 18 Oct 2017 12:57:30 +0200, Arnout Vandecappelle wrote:
> >  As I said a couple of times already, I don't think we should enforce -Orecurse.
> 
> As I replied in another e-mail, I disagree :)
> 
> >  About the BR2_PARALLEL_BUILD option, it may be useful, but for the time being I
> > would continue asking the user to remove the .NOTPARALLEL line.

Eventually, when everything is fully parallel-safe, I believe we will
want to remove BR2_JLEVEL altogether, and let users directly call
"make -jN".

As for the -O option, it all depends on the oldest make we are supposed
to support. It appeared only in make 4.0, released in October 2013.

So I think we'll have to come up with an alternative solution (and I am
sad that we do, I would have prefered we require 4.0, but it is not old
enough :-/ ).

However, I'll repeat my position: having top-level parallel build (TLP)
is important. If we can't find a viable, simple and maintainable
solution, then we should just ignore the problem and still implement
TLP.

I am not much happy with any of the external wrapper, because it is
relatively fragile, and we have to use it everywhere we need to write a
make rule (which is not a package, fs, or bootloader CMDS).

For example, we also need to use it for:

  - the step_start and step_end hooks
  - the intermediate commands [0] [1]
  - ech commands in the finalise-target, legal-info and all similar ones
  - and I suspect countless other locations...


[0] for example, it is needed for the for-loop there:
   package/pkg-generic.mk:
   145 $(BUILD_DIR)/%/.stamp_downloaded:
   146 ?   $(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
   147 # Only show the download message if it isn't already downloaded
   148 ?   $(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
   149 ?   ?   if test ! -e $(DL_DIR)/`basename $$p` ; then \
   150 ?   ?   ?   $(call MESSAGE,"Downloading") ; \
   151 ?   ?   ?   break ; \
   152 ?   ?   fi ; \
   153 ?   done
   154 ?   $(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
   155 ?   $(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
   156 ?   $(Q)mkdir -p $(@D)
   157 ?   $(Q)touch $@


[1] for example, it is needed for each of mkdir, chmod and touch there:
   package/pkg-generic.mk:
   166 $(BUILD_DIR)/%/.stamp_extracted:
   167 ?   @$(call step_start,extract)
   168 ?   @$(call MESSAGE,"Extracting")
   169 ?   $(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
   170 ?   $(Q)mkdir -p $(@D)
   171 ?   $($(PKG)_EXTRACT_CMDS)
   172 # some packages have messed up permissions inside
   173 ?   $(Q)chmod -R +rw $(@D)
   174 ?   $(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
   175 ?   @$(call step_end,extract)
   176 ?   $(Q)touch $@


Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
