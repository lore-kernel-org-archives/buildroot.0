From: James Knight <james.knight@rockwellcollins.com>
Date: Tue, 18 Aug 2015 11:12:51 -0400
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <20150818114453.05e19fae@free-electrons.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
 <20150818114453.05e19fae@free-electrons.com>
Message-ID: <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Aug 18, 2015 at 5:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> It is rather unclear why, in the context of Buildroot, a host RPM would
> be needed, and why an initial RPM database would have to be setup. Can
> you expand on this?

The example case I have (which I really should have provided in the
commit message; sorry), is that for my target I use rpm's to provide
additional modifications on my target. I use the rpm system and a
specific directory to install/track and persist these modifications on
said target. The workaround I had been using with the rpm system was
that when installing these modification I had to use the `--nodeps`
option. Without this option, rpm packages would not install since it
couldn't find specific dependencies in the system; for example, not
understanding that "/var/lib" exists or that "/bin/sh" is an available
executable.

In order to avoid skipping the dependency check, I had to track these
dependencies in the rpm database using another package (a "base" or
"core" package). So, I would generate a rpm package which would track
directories and executables required for any modification to depend on
and install that package in the post-build phase. This would provide a
target image which my "core" package installed and the user would
automatically be ready to install additional software packages.

Now, my first attempts were just to build and install my "core" rpm
package using my host system's rpm package. That didn't work since my
rpm-support on my Fedora system (4.12) doesn't generate the same rpm
database format used by the current rpm package version found in
Buildroot (5.2). Hence, I needed a host variant of rpm to match my
target system's rpm to produce a correct initial database.

> Also, same comments as for beecrypt and neon.

You're absolutely correct. I got caught up in the mindset that "I need
to make my host rpm package match exactly to my variant rpm package"
(based on my previous point I mentioned above). I can go ahead and
update this patch (along with beecrypt and neon) to remove any host
variant make definitions depend on `BR2_PACKAGE_*` configuration
options (if you still feel the host variant modifications are still
useful).

That being said, I worry about the case where a developer builds the
host variant and target variant rpm package with different settings.
For example, a target system has a built rpm package without bzip2
support and the host variant does support it. Now the responsibility
of ensuring not to compress built packages via bzip2 is now passed off
to other developers; something I'd like to avoid. When setting up a
configuration, I'd rather just have the option to configure my host
variant rpm package to match capabilities found on my target variant.
What I feel now is maybe I should have a host configuration item for
my host rpm package indicating if it should include bzip2 support (and
any other setting that really affects capabilities between the host
and variant package). Thoughts?

On Tue, Aug 18, 2015 at 5:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear James Knight,
>
> On Thu, 13 Aug 2015 13:14:51 -0400, James Knight wrote:
>> The following adds support for a host variant of the rpm package. This
>> support will allow a host system to setup/manipulate a target system's
>> initial RPM database during the post-build phase.
>
> It is rather unclear why, in the context of Buildroot, a host RPM would
> be needed, and why an initial RPM database would have to be setup. Can
> you expand on this?
>
> Also, same comments as for beecrypt and neon.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
