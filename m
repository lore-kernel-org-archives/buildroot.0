From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Sep 2013 11:15:27 +0200
Subject: [Buildroot] SVN process started at make
In-Reply-To: <15AE5A936F5E3A42A9144E66875A0A8934DB3F@server1-derijp.CLB-Benelux.lokaal>
 (Ruud Commandeur's message of "Wed, 4 Sep 2013 10:57:33 +0200")
References: <15AE5A936F5E3A42A9144E66875A0A8934DB3B@server1-derijp.CLB-Benelux.lokaal>
 <87sixm558s.fsf@dell.be.48ers.dk> <52260E11.4090103@mind.be>
 <15AE5A936F5E3A42A9144E66875A0A8934DB3E@server1-derijp.CLB-Benelux.lokaal>
 <20130904100754.297bb0d6@skate>
 <15AE5A936F5E3A42A9144E66875A0A8934DB3F@server1-derijp.CLB-Benelux.lokaal>
Message-ID: <87zjrt3q34.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ruud" == Ruud Commandeur <RCommandeur@clb.nl> writes:

 Ruud> Dear Thomas,
 Ruud> Well, I did take a quick look at this file, but could have seen this
 Ruud> myself indeed :-)

 Ruud> So it runs an "svn info" and "svn status". This last command can take
 Ruud> quite some time for a large repository, so this explains the delay.

Ok, I'm afraid there's not much to do about svn being crap :/

How come you are only seeing this now? We've been calling
setlocalversion since 2010. Did you recently upgrade your svn version?

Looking at the kernel history (where setlocalversion comes from), I see
a commit from Mike Frysinger where the svn status step is skipped as it
was deemed too slow, so perhaps we should just resync our
setlocalversion script with the kernel:

Author: Mike Frysinger <vapier.adi@gmail.com>
Date:   Thu Feb 5 16:13:32 2009 +0800

    kbuild,setlocalversion: shorten the make time when using svn
    
    Don't bother doing `svn st` as it takes a retarded amount of time when
    the source is cold
    
    Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
    Signed-off-by: Bryan Wu <cooloney@kernel.org>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index f6946cf..f1c4b35 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -58,14 +58,7 @@ fi
 # Check for svn and a svn repo.
 if rev=`svn info 2>/dev/null | grep '^Last Changed Rev'`; then
        rev=`echo $rev | awk '{print $NF}'`
-       changes=`svn status 2>/dev/null | grep '^[AMD]' | wc -l`
-
-       # Are there uncommitted changes?
-       if [ $changes != 0 ]; then
-               printf -- '-svn%s%s' "$rev" -dirty
-       else
-               printf -- '-svn%s' "$rev"
-       fi
+       printf -- '-svn%s' "$rev"
 
        # All done with svn
        exit

I'll do that now.

-- 
Bye, Peter Korsgaard
