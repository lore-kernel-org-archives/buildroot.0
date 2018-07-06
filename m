From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Jul 2018 17:10:15 +0200
Subject: [Buildroot] [PATCH 00/50] busybox: invert dependencies
In-Reply-To: <4f9e3665-aecc-5067-02aa-25b4a816195c@mind.be>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <907b4fa8-f2c6-120d-4980-95b9a5e656a1@mind.be>
 <20180704163928.GB2595@scaer>
 <4f9e3665-aecc-5067-02aa-25b4a816195c@mind.be>
Message-ID: <20180706151015.GA3128@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-07-06 00:54 +0200, Arnout Vandecappelle spake thusly:
> On 04-07-18 18:39, Yann E. MORIN wrote:
> > Arnout, all,
> > 
> > On 2018-07-04 00:56 +0200, Arnout Vandecappelle spake thusly:
> >> On 07/02/18 23:12, Yann E. MORIN wrote:
> >>> Hello All!
> >>>
> >>> Currently, the issue that busybox may install the same executables as
> >>> those from other packages, is handled in all those packages. This is
> >>> not very practical.
> >>
> >>  The reverse is also not very practical...
> > 
> > The reverse means that the dependencies are sprinkled in all those
> > packages, while now they are all nicely gathered in a single location.
> > At least, I believe this is a maintenance improvment; not an enormous
> > gain, but still.
> 
>  It certainly is!

Is that an ACK of the patch? ;-p

> 
> >>> Furthermore, this means that those packages all overwrite the
> >>> busybox-installed applets, which means that this triggers the
> >>> no-two-packages-touch-the-same-file rule. So far, this is only a
> >>> warning, but when we eventually go with TLPB, we'll have to enforce
> >>> that rule.
> >>
> >>  Although we've already discussed this a couple of times in BR meetings, we
> >> never found a solution that is really satisfactory.
> > 
> > I'm not sure what you mean by "satisfactory". If speakign about busybox,
> > I think this solution is technically better than the alternative,
> > current situation, at least becasue we know that busybox will enforce a
> > noclobber install (heck, this was already the case with our hook), while
> > we can not easily audit all packages to be sure they properly install
> > their executalbes.
> 
>  Well, normally the proper way to install is to overwrite what was previously there.
> 
>  So the solution is not entirely satisfactory because it only really applies to
> busybox. Which means that for other packages, we either have to perform manual
> install commands to prevent overwriting, or we have to revert the dependency
> (i.e., for busybox, the first package wins, while for other packages, the last
> package wins...).

OK, I see what you meant. Right.

>  Also note that in the latter case, we should allow two packages to touch the
> same file, at least as long as there is a dependency between them. Indeed, if
> there is a dependency, then the build result is reproducible, so there is no
> need to disallow it. Checking for that will get hairy though...
> 
> 
> > For example, the attr package we current have will forcibly overwrite
> > any destination file without unlinking it, thus effectively replacing
> > /usr/bin/setfattr withits own code, and if that fiel happens to be a
> > hardlink or a symlink to busybox, we lose busybox. See
> >     https://bugs.busybox.net/show_bug.cgi?id=10986
> 
>  *That* is really a bug in the attr package. If it would use install, like the
> rest of the world does, it wouldn't have this problem.

And I fixed it, and upstream also fixed it by switching to automake.

My point was that we can't audit all such packages, because it is a pita.

> > So, I think it is better to rely on a single package we know behaves
> > correctly.
> > 
> >>  However, I have a new idea now...
> >>
> >>  IIUC, with PPS, there is no real problem with two packages touching the same
> >> file, as long as the dependency is explicitly tracked in Buildroot, right?
> >> Because when it is explicitly tracked, the file created by package A will always
> >> be present in package B's PPS when package B is built, so it's perfectly
> >> reproducible.
> 
>  Huh weird, I thought this was a new idea I had tonight, but apparently I
> already thought of it yesterday :-)

Eh! I'm more of the other kind of people, going lke "hmm, what was I
thinking minutes ago? It was super important and so exceptional, too
bad I can't remember..." ;-)

Yes, we could relax the rule, to say that a package can only modify
files in {,/usr}/{,s}bin, but modifing (replacing/appending) to a file
in any other location is forbidden.

But that is still not very nice either. Say, two packages install
/sbin/httpd, and the two want to install its config file /etc/httpd.conf
The first replacement is OK, the second is not.

But as you say, hat causes issues is appending, not replacing. So, we
could further relax, saying "replacing is OK, not appending", but then
how do we differentiate an append from a replace?

[--SNIP--]
>  OK. Just thought I'd shoot the idea.

Yes, but we already have a lot of trouble even landing TLPB at all.
Making the implementation even more complex can only postpone TLPB.

And ultimately, we can refine the implentation later, and then relax the
restrictions. It is easier for user to upgrade to a more laxist implem,
rather than going to a more restrictive one...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
