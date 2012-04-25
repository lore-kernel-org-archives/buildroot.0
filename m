From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 25 Apr 2012 07:23:37 +0200
Subject: [Buildroot] How do you add a package subdirectory?
In-Reply-To: <jn795b$kbq$1@dough.gmane.org>
References: <jn795b$kbq$1@dough.gmane.org>
Message-ID: <CAAXf6LU8+LZGYn-BQTkyjzDEQgLDkGeHrsd5WBt7NftnVfCjPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

On Wed, Apr 25, 2012 at 12:23 AM, Grant Edwards
<grant.b.edwards@gmail.com> wrote:
> I'm trying to add local packages to 2012.02, and I'd like them to live
> in a subdirectory underneath "package" (e.g. package/mycompany). I've
> created the "mycompany" directory which contains a Config.in that
> declares a submenu that in turn sources the individual package
> Config.in files: package/mycompany/foo/Config.in,
> package/mycompany/bar/Config.in, etc.
>
> The "mycompany" submenu shows up where it's supposed to, and that menu
> has the entries for "foo" and "bar" as it should. ?Selecting those
> entries sets BR2_PACKAGE_FOO in the .config file as expected.
>
> But, when I actually do the "make", buildroot won't attempt to build
> packages "foo" and "bar" unless I create symlinks in the packages
> directory that point to the corresponding directories in the mycompany
> subdirectory like this:
>
> ? package/foo -> mycompany/foo
> ? package/bar -> mycompany/bar
>
> Inside foo.mk, bar.mk the various settings/commands have the
> "mycompany" directory in them, and once buildroot _finds_ the .mk
> files, they build fine.
>
> I've searched the existing scripts and .in files for some mechanism
> that's used by the other packages that live in subdirectories
> underneat packages, but couldn't find anything. As far as I can tell,
> I've done everything in my new subdirectory exactly the same way it's
> done in the other subdirectories, but it just doesn't work.
>
> How does buildroot know that when BR2_PACKAGE_AUMIX is set it's
> supposed to look for package/multimedia/aumix/aumix.mk and not
> package/aumix/aumix.mk?
>
> How do I get buildroot to look in package/mycompany for the foo and
> bar package directories?

Have a look at http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf,
pages 27-28 where this scenario is described.

What I think you are missing is the top-level .mk file in
/package/company/company.mk which includes all sub-mk files.

In Buildroot, all makefiles are included into one big top-level
Makefile whenever you type 'make'. For the packages, this is done with
wildcards: Makefile includes package/*/*.mk
If you have .mk files in other locations (package/*/*/*.mk), you have
to include them yourself, inside a .mk file at package/*/*.mk level.

Best regards,
Thomas
