From: Konrad Eisele <konrad@gaisler.com>
Date: Fri, 18 Nov 2011 08:49:30 +0100
Subject: [Buildroot] [PATCH 1/1] kconfig: Add a configuration subtree
	command to kconfig
In-Reply-To: <1321602124-1761-1-git-send-email-konrad@gaisler.com>
References: <CAAXf6LXJLXQ1tm_zQTH=XaBLZBEnt0W3u14aYZJ0e0K0vZ5ohw@mail.gmail.com>
 <1321602124-1761-1-git-send-email-konrad@gaisler.com>
Message-ID: <4EC60E0A.6090802@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Konrad Eisele wrote:
> New kconfig command "subsource":
> subsource "<kconfig>" "<cwd>" "<.config>" "<title>"  <internal_prefix> <.config_prefix>
> Allocates <kconfig> as a configuration subtree using <.config> as the configuration
> file to save and load from. <cwd> is the directory path to switch to for "source" to
> work, "<title>" is the Menu tile of the subtree, <internal_prefix> is a internal prefix,
> and <.config_prefix> is the prefix to append/remove when saving/loading <.config>.
> 
> Signed-off-by: Konrad Eisele <konrad@gaisler.com>
> ---
>  Makefile                             |    8 +-
>  support/kconfig/conf.c               |    6 +-
>  support/kconfig/confdata.c           |  100 +++-
>  support/kconfig/expr.h               |   15 +
>  support/kconfig/gconf.c              |    3 +
>  support/kconfig/lex.zconf.c_shipped  |   74 ++-
>  support/kconfig/lkc.h                |    1 +
>  support/kconfig/lkc_proto.h          |    5 +
>  support/kconfig/mconf.c              |   13 +-
>  support/kconfig/menu.c               |    3 +-
>  support/kconfig/nconf.c              |   13 +-
>  support/kconfig/qconf.cc             |    3 +
>  support/kconfig/symbol.c             |   50 ++-
>  support/kconfig/util.c               |   55 ++
>  support/kconfig/zconf.gperf          |    1 +
>  support/kconfig/zconf.hash.c_shipped |  145 +++---
>  support/kconfig/zconf.l              |   50 ++-
>  support/kconfig/zconf.tab.c_shipped  |  969 ++++++++++++++++++----------------
>  support/kconfig/zconf.y              |   23 +-
>  19 files changed, 946 insertions(+), 591 deletions(-)
> 

This time the patch is only for the "subsource" tag. I implemented "-s" switch (that enables the "subsource" tag)
for mconf, nconf, gconf and qconf.
To test you might want to flatten the Kconfig scripts of for instance busybox, use the script below.

If you create a flattened version in package/busybox/busybox-1.19.x.in you can add  i.e.:
subsource "package/busybox/busybox-1.19.x.in" "package/busybox/" "package/busybox/busybox-1.19.x.config" "Busybox 1.19.x configuration"  BUSYBOX_ CONFIG_
To get busybox Kconfig as a subtree. (Or you can add the original Kconfig directory hirarchy of course...).


------ flatten.pl -------

#!/usr/bin/perl

flatten($ARGV[0]);

sub readfile {
    my ($in) = @_;
    usage(\*STDOUT) if (length($in) == 0) ;
    open IN, "$in" or die "Reading \"$in\":".$!;
    local $/ = undef;
    $m = <IN>;
    close IN;
    return $m;
}

sub flatten {
    my ($f) = @_;
    foreach my $l (split("\n",readfile($f))) {
	if ($l =~ /^\s*source/) {
	    print ("# -> $l\n");
	    my $nf = substr($l,length($&));
	    $nf =~ s/"//g;
	    flatten($nf);
	} else {
	    print ("$l\n");
	}
    }
}
