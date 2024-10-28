Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF84D5B14E
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98620607ED;
	Mon, 28 Oct 2024 20:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBwqL1nAILfv; Mon, 28 Oct 2024 20:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F78A60707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F78A60707;
	Mon, 28 Oct 2024 20:52:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AD014EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BB1940252
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlmyvHZGhhxc for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D73C40241
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D73C40241
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:52:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04C4D84459; Mon, 28 Oct 2024 20:52:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 21:51:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c808e271e3e487a46f23b144b44ace54f97f3aab
X-Git-Newrev: 67249a691d2671252d033931b54fd654769ca7ce
X-Patchwork-Hint: ignore
Message-Id: <20241028205240.04C4D84459@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/adding-packages-directory:
 describe start script details
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67249a691d2671252d033931b54fd654769ca7ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This codifies style elements discussed on the mailing list, most
importantly PID file handling, and adds detailed considerations for
writing start scripts.

References:
https://lore.kernel.org/buildroot/20240712124956.3925574-1-fiona.klute@gmx.de/
https://lore.kernel.org/buildroot/20240714223645.39adf8c6@windsurf/
https://lore.kernel.org/buildroot/9ec13ac0-b5b6-4251-98b8-0d8f7adac452@gmx.de/

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.adoc | 123 ++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index cb19f3bac9..44852afa04 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -576,23 +576,120 @@ name.  The +NN+ is the start order number which needs to be carefully
 chosen.  For example, a program that requires networking to be up should
 not start before +S40network+.  The scripts are started in alphabetical
 order, so +S01syslogd+ starts before +S01watchdogd+, and +S02sysctl+
-start thereafter.
+starts thereafter.
 
 [source,sh]
 ----
 include::S01syslogd[]
 ----
 
-*Note:* programs that support reloading their configuration in some
-fashion (+SIGHUP+) should provide a +reload()+ function similar to
+Scripts should use long form options where possible for clarity.
+
+==== Start script configuration
+
+Both start scripts and unit files can source command line arguments
+from +/etc/default/foo+, where +foo+ is the daemon name as set in the
++DAEMON+ variable. In general, if such a file does not exist it should
+not block the start of the daemon, unless there is some site specific
+command line argument the daemon requires to start. For start scripts
++FOO_ARGS="-s -o -m -e -args"+ can be defined to a default value in
+the script, and the user can override this from +/etc/default/foo+.
+
+==== Handling the PID file
+
+A PID file is needed to keep track of what the main process of a
+service is. How to handle it depends on whether the service creates
+its own PID file, and if it deletes it on shutdown.
+
+* If your service doesn't create its own PID file, invoke the daemon
+  in foreground mode, and use +start-stop-daemon --make-pidfile
+  --background+ to let +start-stop-daemon+ create the PID file. See
+  +S01syslogd+ for example:
++
+[source,sh]
+----
+start-stop-daemon --start --background --make-pidfile \
+	--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
+	-- -n $SYSLOGD_ARGS
+----
+
+* If your service creates its own PID file, pass the +--pidfile+
+  option to both +start-stop-daemon+ *and the daemon itself* (or set
+  it appropriately in a configuration file, depending on what the
+  daemon supports) so they agree on where the PID file is. See
+  +S45NetworkManager+ for example:
++
+[source,sh]
+----
+start-stop-daemon --start --pidfile "$PIDFILE" \
+	--exec "/usr/sbin/$DAEMON" \
+	-- --pid-file="$PIDFILE" $NETWORKMANAGER_ARGS
+----
+
+* If your service removes its PID file on shutdown, use a loop testing
+  that the PID file has disappeared on stop, see +S45NetworkManager+
+  for example:
++
+[source,sh]
+----
+while [ -f "$PIDFILE" ]; do
+	sleep 0.1
+done
+----
+
+* If your service doesn't remove its PID file on shutdown, use a loop
+  with +start-stop-daemon+ checking if the service is still running,
+  and delete the PID file after the process is gone. See +S01syslogd+
+  for example:
++
+[source,sh]
+----
+while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+	--exec "/sbin/$DAEMON"; do
+	sleep 0.1
+done
+rm -f "$PIDFILE"
+----
++
+Note the +--test+ flag, which tells +start-stop-daemon+ to not
+actually stop the service, but test if it would be possible to, which
+fails if the service is not running.
+
+==== Stopping the service
+
+The stop function should check that the daemon process is actually
+gone before returning, otherwise restart might fail because the new
+instance is started before the old one has actually stopped. How to do
+that depends on how the PID file for the service is handled (see
+above). It is recommended to always append +--exec "/sbin/$DAEMON"+ to
+all +start-stop-daemon+ commands to ensure signals are sent to a PID
+that matches +$DAEMON+.
+
+==== Reloading service configuration
+
+Programs that support reloading their configuration in some fashion
+(e.g. +SIGHUP+) should provide a +reload()+ function similar to
 +stop()+. The +start-stop-daemon+ command supports +--stop --signal
-HUP+ for this. It is recommended to always append +--exec
-"/sbin/$DAEMON"+ to all +start-stop-daemon+ commands to ensure signals
-are set to a PID that matches +$DAEMON+.
-
-Both start scripts and unit files can source command line arguments from
-+/etc/default/foo+, in general, if such a file does not exist it should
-not block the start of the daemon, unless there is some site specirfic
-command line argument the daemon requires to start.  For start scripts a
-+FOO_ARGS="-s -o -m -e -args"+ can be defined to a default value in and
-the user can override this from +/etc/default/foo+.
+HUP+ for this. When sending signals this way, whether SIGHUP or
+others, make sure to use the symbolic names and not signal
+numbers. Signal numbers can vary between CPU architectures, and names
+are also easier to read.
+
+==== Return codes
+
+The action functions of the start script should return a success (or
+failure) code, usually the return code of the relevant
+start-stop-daemon action. The last one of those should be the return
+code of the start script as a whole, to allow automatically checking
+for success, e.g. when calling the start script from other
+scripts. Note that without an explicit +return+ the return code of the
+last command in a script or function becomes its return code, so an
+explicit return is not always necessary.
+
+==== Logging
+
+When a service forks to the background, or +start-stop-daemon
+--background+ does that, stdout and stderr are generally closed, and
+anything log messages the service may write there get lost. If
+possible, configure your service to log to syslog (preferably), or a
+dedicated log file.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
