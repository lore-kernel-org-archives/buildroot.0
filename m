From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Sep 2013 00:16:13 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <523388B6.7090305@mind.be>
References: <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
Message-ID: <20130914221613.GA3444@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

Once again, I am not a lawyer, and the below is not legal advice.
Anyone sane would consult a lawyer for a definitive legal counsel.

On 2013-09-13 23:50 +0200, Arnout Vandecappelle spake thusly:
> On 13/09/13 00:12, Yann E. MORIN wrote:
> >On 2013-09-13 00:04 +0200, Arnout Vandecappelle spake thusly:
> [snip]
> >>but the GPL is pretty
> >>clear on this:
> >>
> >>"If identifiable sections of that work are not derived from the Program,
> >>and can be reasonably considered independent and separate works in
> >>themselves, then this License, and its terms, do not apply to those
> >>sections when you distribute them as separate works."
> >>
> >>  i.e. you can distribute the source of buildroot itself separately from your
> >>external directory.
> >
> >Yes, but I believe BR2_EXTERNAL *is* a derived work of Buildroot, so as
> >such should be licensed under a license compatible with Buildroot's.
> >
> >>  As long as your external stuff merely aggregates with the GPL'd stuff under
> >>buildroot, there shouldn't be an issue.
> >
> >But that's not aggregation in my opinion, since it does leverage all or
> >parts of the Buildroot infrastrucutre, and was clearly written with this
> >intent, and as such can not be considered mere aggregation.
> >
> >Of course, all this only applies _if and when_ BR2_EXTERNAL gets
> >distributed to a third party.
> 
>  The more I think about it, the more confused I get :-) Although your other
> reply to Andy sums things up pretty clearly.
> 
>  Let me try out a few scenarios (I'm making things up as I go here).
> 
>  I have made some changes to buildroot, and I have also made an external
> tree.
> 
> 
> 1. I want to distribute the modified buildroot tree to someone. Do I also
> have to make the external one available?
> 
>  => No, because the buildroot tree in fact doesn't refer to the external
> tree. You run "BR2_EXTERNAL=... make".

Agreed, I think.

> 2. I distribute a rootfs which contains a GPL program (bash). Do I have to
> make the buildroot tree available?
> 
>  => Yes, because I have to make the build scripts for bash available, and
> buildroot is the build script that I've used.

Yes, because of section 3 of the GPL this program is licensed under.

Although strict compliance does not _require_ you to distribute your
Buildroot tree (since by giving the 'make' commands would be enough),
giving your Buildroot tree makes this so much easy that you would
probably want to do that rather than extract the commands run by
Buildroot.

> 3. I use buildroot to build lua. I copy the lua executable out of the
> target/ tree and distribute it. Do I have to make the buildroot tree
> available?
> 
>  => No, because lua is MIT licensed.

Indeed, no. But that does not preclude any other reason why you would
have to distribute your Buildroot tree (eg. case 2, above).

> 4. I distribute a rootfs which contains a GPL program (bash). It also
> contains a proprietary program (foo). I have added a foo.mk file to the
> buildroot tree to build my proprietary program. Do I have to make the
> modified buildroot tree available?
> 
>  => Probably not. I have to make the build script for bash available, but
> the original buildroot tree already does the job.
> 
>  I believe that this reasoning holds regardless of whether the foo.mk is
> added directly in the buildroot tree or through BR2_EXTERNAL (or through
> override.mk).

These are muddy waters.

If the unmodified Buildroot tree is enough to rebuild the GPL program,
then I would not see any valid reason to object.

But you'd have to have a *very good* process that ensures that your
Buildroot modifications do *not* impact the build of the GPL program.
A very good process, indeed, as soon as your team is more than a (very)
few people.

> 5. I add a proprietary binary to the default skeleton and distribute the
> rootfs built by buildroot. Do I have to make the modified buildroot with the
> proprietary binary available?
> 
>  => I don't think so, because the proprietary binary is merely aggregated
> with the rest of the buildroot-generated stuff.

Same answer as case 4, above. Be sure to have a very good process.

> 6. Can I give the buildroot tree + the external tree to someone else?
> 
>  => Yes, but only under the GPL - the GPL applies to the external tree as
> well.

(Note: when I say 'BR2_EXTERNAL', I'm speaking about the content of the
directory pointed to by the value of the variable BR2_EXTERNAL, unless
otherwise stated.)

That's all I was arguing about: BR2_EXTERNAL is a derived work of
Buildroot, so is bound to the same licensing terms as Buildroot is.

Since Buildroot's license is the GPLv2, BR2_EXTERNAL is covered by the
GPLv2.

Since the GPLv2 is a license which terms apply at the time of
distribution, as long as you do not distribute BR2_EXTERNAL, you are
free to do whatever you want with BR2_EXTERNAL. But as soon as you
distribute BR2_EXTERNAL (either because you decide to do so on your own
will, or because you are required to, as in case 2, above), you are
bound to distribute it under the terms of the GPLv2 (or arguably under a
license that is compatible with the GPLv2, eg. BSD).


Now let me add a few more cases:

7. I add a new package to Buildroot, for a GPL program, but do so in
   BR2_EXTERNAL.

   Do I have to distribute my BR2_EXTERNAL?
   Do I have to distribute my Buildroot tree?

=> Yes to both questions, for the same reasons as case 2, above.


8. My BR2_EXTERNAL contains the package described in case 7, above, plus
   a package for a proprietary program.

   Can I expunge the package for the proprietary program from BR2_EXTERNAL
   before I distribute it?

=> Yes, this is the same as cases 4 and 5, above.

====

Also, I was wondering if we could not have BR2_EXTERNAL (the variable)
be a list of external directories (colon-separated, a-la PATH)?

I would use it that way:
    BR2_EXTERNAL="/path/to/my/local/GPL/packages"
    BR2_EXTERNAL+=":/path/to/my/proprietary/packages"
    export BR2_EXTERNAL
    make ....

This would even make it much easier to separate proprietary packages, so
they do not leak, while making it easy to comply for GPL-like packages.

Thoughts?

====

>  After thinking about it this much, it looks like the buildroot license is a
> lot more lenient than I first thought. But of course, I don't really now.

I don't believe you could call the GPLv2 'lenient'. In fact I would call
it anything but lenient: anything that is a derived work of Buildroot is
covered by its license.

Note: the target rootfs is *not* a derived work of Buildroot.

>  Maybe we should organize a discussion about this in the legal track at
> FOSDEM.

Yes, that would make for a very good case on the (L)GPL.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
