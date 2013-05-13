From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 23:21:54 +0200
Subject: [Buildroot] A new version of http://autobuild.buildroot.org
Message-ID: <20130513232154.477c6c7b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I promised it since a looong time, and finally got around to do it.
There is a new version of http://autobuild.buildroot.org online. At
first sight, the difference may not be very visible, because most of
the changes are in the background, but will allow to add more features
over time.

In the background, the changes are that:

 * Build results are stored in a MySQL database, which allows to do all
   kind of statistics.

 * In addition to build results themselves, the value of all kconfig
   options, for all builds, are also stored in the database. This will
   allow to do queries like "give me all the successful build results
   of the last 30 days that had BR2_PACKAGE_BLEH=y". For now, there is
   no public interface to make such queries, but the information is
   available in the database.

 * The results are no longer stored in a single flat directory, with
   one directory per build result, named after the SHA1. Instead they
   are stored in results/<first 3 characters of the SHA1>/<SHA1>/. This
   will allow to overcome the 32.000 limit of files per directories.
   And in fact, the new http://autobuild.buildroot.org has the entire
   50232 build results since this service was started!

   It is worth mentioning that URLs of the form
   http://autobuild.buildroot.org/results/<SHA1>/ are still working,
   thanks to a smart Apache rewrite rule. It should be completely
   transparent, and allows all the Git commit log that we have that
   refer to build failures to continue to work.

The visible changes are:

 * All build results since the start of the service are now visible.

 * The main page shows 50 results instead of 25 results.

 * You can filter to see only successful results, or failed results, by
   clicking on "OK" or "NOK". You can also access
   http://autobuild.buildroot.org/?status=NOK and
   http://autobuild.buildroot.org/?status=OK.

 * There is a page http://autobuild.buildroot.org/stats.php, with build
   stats of the last 30 days, since the beginning of the service, and a
   nice graph showing success/failures/timeouts/total for each day of
   the last 30 days.

 * The format of the daily e-mail will be different. It will show a
   classification of the failures by "reason" (i.e failing package),
   ordered by the package causing the highest number of failures first.
   Then, the list of all failures will be much shorter, and hopefully
   easier to read and analyze.

 * The full build log is no longer available. Storing those entire
   build logs was consuming a huge amount of disk space. I assume that
   the last 100 lines of the build log are sufficient to have a rough
   idea of what's going. Otherwise, the build can easily be reproduced.

I hope nothing got broken. Build results both from Peter's autobuilders
and from my autobuilder continue to arrive and be registered, and I
think I didn't miss any of them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
