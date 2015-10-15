From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 22:52:39 +0200
Subject: [Buildroot] [PATCH v7] dependencies.sh: improve the missing
 perl modules detection
In-Reply-To: <1443516422-33997-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443516422-33997-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151015225239.569c0ea6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Tue, 29 Sep 2015 09:47:02 +0100, Vicente Olivert Riera wrote:

> -# Check that the Perl installation is complete enough to build
> -# host-autoconf.
> -if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
> -	echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
> -	echo "On Debian/Ubuntu distributions, install the 'perl' package."
> +# Check that the Perl installation is complete enough for Buildroot.
> +required_perl_modules="Data::Dumper" # Needed to build host-autoconf
> +required_perl_modules="$required_perl_modules Thread:Queue" # Used by host-automake

Thread:Queue doesn't exist, it's named Thread::Queue.

> +if [ -n "$missing_perl_modules" ] ; then
> +	echo "Your Perl installation is not complete enough; at least the following"
> +	echo "modules are missing:"
> +	echo
> +	for pm in $missing_perl_modules ; do
> +		echo -e "\t $pm"

echo -e is not POSIX, using printf is better.

I've applied your patch with those two issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
