From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 07 Jan 2009 20:13:44 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090107180208.GA14648@zelow.no>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<1231268529.32308.222.camel@elrond.atmel.com>
	<87y6xomehq.fsf@macbook.be.48ers.dk>
	<1231274947.32308.260.camel@elrond.atmel.com>
	<87ljtnl5g9.fsf@macbook.be.48ers.dk>
	<1231331663.32308.358.camel@elrond.atmel.com>
	<20090107180208.GA14648@zelow.no>
Message-ID: <1231355624.32308.410.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-07 klockan 19:02 +0100 skrev Thomas Lundquist:
> On Wed, Jan 07, 2009 at 01:34:23PM +0100, Ulf Samuelsson wrote:
> > 
> > We need to differentiate between testing and releases.
> > I have already made the comment, that I believe 
> > a distribution should use a single version of the source
> > (with patches).
> 
> That's what tags, branches and releases are for. 
> Having separate makefiles sounds messy.

I am not an expert in Source Code Management,
but do you have this capability in Subversion?
I know you have it in git, but using git
is apparently not an option.

I do not see it as too messy to use directories.

Go to the package/<package> directory and create a new
directory, copy the files but not the svn info 
from the old distribution directory X.Y.Z. 
Call the new directory X1.X2.X3.

Add 

"<package>_VERSION=Z1.Y1.Z1"

to a file, and and

?select BR2_PACKAGE_<package>

to another, and your are ready to go.

ONce you ahve added a patch, then it will be easy
for other people to test this by adding 
?
"<package>_VERSION=Z1.Y1.Z1"
?select BR2_PACKAGE_<package>

to their private override files.

For testing you provide a list of overrides.
??If a package build, then you commit
	select BR2_PACKAGE_<package>
to the architecture enable file.

Once the "enable" file for all architectures contain this select
then the package can be considered to be validated,
and can be released.

Then again, my requirement is not that it needs
to be implemented in a certain way, just
that the functionality of beeing able to 
start with a distribution, 
and work on that distibrution + own changes,
and commit those changes for review by others
without breaking the build would be good.

You can review changes by code reading,
and you can build to check that it compiles
but if you want to check that it actually
runs then someone with the right H/W needs
to build and run the code.


> > I am talking about the process of getting a package
> > into the stable distribution, and currently there
> > is no process of doing this.
>
> You could tag each package in Config.in or something 
> with "UNTESTED" "TESTING" or whatever aswell, then change or remove when
> we know it works.
> 
> (Or just use EXPERIMENTAL as other projects does)
> 

If you can accomplish what I want, then I do not
mind using an SCM.

> > Your goal of a single source package that will not break
> > for any supported architecture will thus be met by the 
> > packages IN the distribution. Packages outside
> > the distribution are not supported.
> 
> This is another story, maybe we should support contrib/*.* like you 
> once had with local/ for out-of-tree packages and boards.
> 

That is important as well, but I am rather thinking
distribution X supports package 1,2,3 but not 4.
You wamt tp develop package 4 support for your arch,
and want to submit patches for others to test.

So you commit a new directory.
Anyone can then take the standard distribution
and then replace this with thier own version.

This is how openembedded works, you have a base distribution
which defines what versions to use, but anyone
can override the package version in their local.conf file.

Anyone (with write access) can introduce and test a new package version
without breaking anyone elses build.


> > It will also allow people to build old distributions.
> 
> That's why we have version control. Just check out an earlier
> revision.
> 
> > When it is time to look at a new release, then
> > it is easy to check what has been introduced
> > since the last distribution, and create 
> > the version file for the new testing phase.
> 
> NEW (and oldconfig)
> 
> > If it does not build, then it is set to broken
> > for that architecture.
> 
> What you are suggesting here is a package-tagging about the status 
> of the package per ARCH.

Yes. But in addition, I would like each architecture
to have access to packages from earlier distributions as well.
In order to avoid support nightmares, updates of
packages belonging to previous packages should not be
permitted, when work is starting on a new revision.

Use of old packages together with the current
distribution is not neccessarily a supported
activity.

If an old package breaks because it is incompatible
with other packages this does not allow the old package
to be updated, then it is simply broken for that architecture

> 
> This would suggest a new file per package with metainfo (Which could be used
> to make Config.in since we'd rather not duplicate information.)
> 
> > If the problem can be fixed with a patch, then
> > a new directory is created with the patch.
> 
> As long as we keep having only one version of each package we won't need
> to do this.
> 



> 
> Thomas.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
