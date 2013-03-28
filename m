From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Mar 2013 09:20:35 +0100
Subject: [Buildroot] [git commit] Makefile: simplify target skeleton
	copying
In-Reply-To: <CAAXf6LWWJMrJBvkf_jwMrrHT73dOy85_iQJpcZVbhF4SKcjjSw@mail.gmail.com>
References: <20130326074214.D6DFF9B2CA@busybox.osuosl.org>
 <5153EE16.8070207@mind.be> <87ip4c3q30.fsf@dell.be.48ers.dk>
 <CAAXf6LWWJMrJBvkf_jwMrrHT73dOy85_iQJpcZVbhF4SKcjjSw@mail.gmail.com>
Message-ID: <5153FD53.3050701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/03/13 09:13, Thomas De Schampheleire wrote:
> Hi,
>
>
> On Thu, Mar 28, 2013 at 9:07 AM, Peter Korsgaard <jacmet@sunsite.dk
> <mailto:jacmet@sunsite.dk>> wrote:
>
>      >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be
>     <mailto:arnout@mind.be>> writes:
>
>       Arnout> On 26/03/13 08:33, Peter Korsgaard wrote:
>       >> +   rsync -au --exclude=.empty --exclude=CVS --exclude=.svn
>     --exclude='*~' \
>       >> +           $(TARGET_SKELETON)/ $(TARGET_DIR)/
>
>       Arnout>  Since TARGET_SKELETON can be configured to point to a git- or
>       Arnout> mercurial-controlled directory, I'd want to exclude those
>     as well. How
>       Arnout> about the --cvs-exclude --include core that ThomasDS
>     introduced?
>
>     We can do that as well. I was a bit afraid of excluding files people
>     wanted to keep, so I kept it how it was - But yes, like likelyhood is
>     quite small.
>
>     Care to send a patch to do this?


  Yes, I care to send a patch, but if you look at my track record for 
submitting infrastructural patches in the last couple of months, don't 
hold your breath.



> Is this really needed?
> I was thinking about this as well, but later had the following reasoning
> (which could be wrong): for svn, if I recall correctly, there is a .svn
> in each subdirectory. This is not the case for .git or .hg (which only
> exist in the root of the repository). If one can assume that no-one puts
> the skeleton in a repository, the exclusion of .svn is enough.

  I had one customer who put their overlay in a separate repository. (OK 
in that particular case it was a subversion repository, but it _could_ 
have been a git/hg repository as well).


> Moreover, the --cvs-exclude option cannot be used in this case, as it
> also removes object files. In my version of rsync, this is the exclusion
> list used by --cvs-exclude:
>
> RCS SCCS CVS CVS.adm RCSLOG cvslog.* tags TAGS .make.state .nse_depinfo
> *~ #* .#* ,* _$* *$ *.old *.bak *.BAK *.orig *.rej .del-* *.a *.olb *.o
> *.obj *.so *.exe *.Z *.elc *.ln core .svn/ .git/ .hg/ .bzr/

  Ouch, that sucks.

  How about:

- Create an rsync-filter file in the support directory;

- Create an RSYNC variable that has the option to use that file;

- Use the RSYNC variable everywhere instead of rsync;

- Document this;

- (optionally) add a Kconfig option to specify additional rsync filters.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
