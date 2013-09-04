From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 10:07:54 +0200
Subject: [Buildroot] SVN process started at make
In-Reply-To: <15AE5A936F5E3A42A9144E66875A0A8934DB3E@server1-derijp.CLB-Benelux.lokaal>
References: <15AE5A936F5E3A42A9144E66875A0A8934DB3B@server1-derijp.CLB-Benelux.lokaal>
 <87sixm558s.fsf@dell.be.48ers.dk> <52260E11.4090103@mind.be>
 <15AE5A936F5E3A42A9144E66875A0A8934DB3E@server1-derijp.CLB-Benelux.lokaal>
Message-ID: <20130904100754.297bb0d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ruud Commandeur,

On Wed, 4 Sep 2013 09:55:50 +0200, Ruud Commandeur wrote:

> Thanks for your reply. This does indeed seem to be the cause. If I make
> this change to the top-level Makefile:
> 
> # Compute the full local version string so packages can use it as-is
> # Need to export it, so it can be got from environment in children (eg.
> mconf)
> -export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell
> $(TOPDIR)/support/scripts/setlocalversion)
> +export BR2_VERSION_FULL:=$(BR2_VERSION)
> 
> things are back to normal.
> 
> Am I correct, that what this setlocalversion does, is add a revision
> mark to the version string? Does it run that for each file to be
> processed (since it can take that long)? For my build it reports
> "2013.02-svn9-dirty". So it seems to check only a number of files and/or
> folders, since the trunk is at revision 84 now, but some folders are
> indeed at 9.

You can check what this script is doing by looking at it in
support/scripts/setlocalversion. For SVN, it does:

# Check for svn and a svn repo.
if rev=`LC_ALL=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
        rev=`echo $rev | awk '{print $NF}'`
        changes=`LC_ALL=C svn status 2>/dev/null | grep '^[AMD]' | wc -l`

        # Are there uncommitted changes?
        if [ $changes != 0 ]; then
                printf -- '-svn%s%s' "$rev" -dirty
        else
                printf -- '-svn%s' "$rev"
        fi

        # All done with svn
        exit
fi

So there are two svn commands, and it normally does them only *once*
per build (i.e per invocation of make).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
