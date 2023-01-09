Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB3DC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 15:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BDC74014D;
	Mon,  9 Jan 2023 15:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDC74014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeH3dv7gHRn2; Mon,  9 Jan 2023 15:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64F59402E7;
	Mon,  9 Jan 2023 15:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F59402E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB05D1BF34C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 15:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D68819D1
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 15:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95D68819D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6-PbTRZCwbg for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 15:23:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F95081919
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F95081919
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 15:23:06 +0000 (UTC)
Received: from fidget.co-bxl (fidget.co-bxl [10.2.0.33])
 by wilbur.contactoffice.com (Postfix) with ESMTP id D41A2A35
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 16:23:04 +0100 (CET)
Date: Mon, 9 Jan 2023 16:22:59 +0100 (CET)
Message-ID: <1166577682.270413.1673277779708@fidget.co-bxl>
MIME-Version: 1.0
X-ContactOffice-Account: com:360785386
To: buildroot@buildroot.org
X-Mailer: ContactOffice Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1673277784; 
 s=20210208-e7xh; d=mailfence.com;
 i=raphael.slagmolen@mailfence.com;
 h=Date:From:Message-ID:Subject:MIME-Version:Content-Type:To;
 l=29412; bh=eKwvTkksTNxfh8fMzmVa8fLNS4siKhBLDsgvnI/zF3Q=;
 b=OG1kjD9M5Sbq4hhpbCscHs7D1Gitju4XMsaUf4KpMwfu8lndyec7PuILq2N0ttUQ
 aYroXSa07rTFC4zK+1BICCtWfQSeMsJTwsziC+nq7W9x9DbrtjjZoPOHfJf/Tz4lDtc
 Oibbrh0Q/oiQF4e7G6XEtoeRl2eNLL720qB+JvrOtxqrhX2VTFd6i2RNEQnRRKeqAsB
 PpzsS5ayFW6GCPYNITnng3uyieVvdY3MgpuYVzixisQcl1rBVckkTX3JnU5d9NMg3nB
 tuAKOTlgVLlfvlnptBQ+k1kpA74pQ/MUTuTCl1Wolt1abAMB2dtEj8bzQ0Z2sJ0/grR
 SNTtXNXCmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mailfence.com
 header.i=raphael.slagmolen@mailfence.com header.a=rsa-sha256
 header.s=20210208-e7xh header.b=OG1kjD9M
Subject: [Buildroot] [PATCH 1/1] utils/make_rich_wrapper.py: add new python
 script to wrap the build process into a colored TUI with progress tracking
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_Slagmolen_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?Rapha=C3=ABl_Slagmolen?= <raphael.slagmolen@mailfence.com>
Content-Type: multipart/mixed; boundary="===============8186663050281503317=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8186663050281503317==
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; 
	boundary="----=_Part_270410_71280179.1673277779706"

------=_Part_270410_71280179.1673277779706
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

As the build process can be long and hard to track, I wrote a little Python
script that try to make it easier for users
to see where in the process they are, what is going on, log filtering and
more.

The script is completly autonomous and doesn't impose anything on the curre=
nt
build process so it should work without
tampering the maintenability of the project's Makefile.

The script has only two dependencies :
=C2=A0=C2=A0 =C2=A0- packaging (for version parsing while checking Buildroo=
t's dependencies)
=C2=A0=C2=A0 =C2=A0- rich (for the colored output and layout)

Features:
=C2=A0=C2=A0 =C2=A0- test the presence of Buildroot's dependencies, with ve=
rsion control and
path validation (for `file`)
=C2=A0=C2=A0 =C2=A0- (optional) test the presence of Buildroot's optional d=
ependencies but
without blocking the process
=C2=A0=C2=A0 =C2=A0- can only do the checking or skip it entirely using com=
mand line option
=C2=A0=C2=A0 =C2=A0- filter the output of the build process while trying to=
 detect
fatal/error/warning/debug loglevel (may have some false positive)
=C2=A0=C2=A0 =C2=A0- can change the filtering level using a command line op=
tion (default on
ERROR)
=C2=A0=C2=A0 =C2=A0- keep track of the amount of work to do using `make ext=
ernal-deps` and
display the overall progress
=C2=A0=C2=A0 =C2=A0- in case the amount of work isn't correctly detected (I=
 try to account for
some specials steps), the progress is fixed at the end with a message
=C2=A0=C2=A0 =C2=A0- keep track of all the task already done and the one cu=
rrently working
=C2=A0=C2=A0 =C2=A0- display the current task's step message (extracted fro=
m `>>> %s` output)
=C2=A0=C2=A0 =C2=A0- keep track of the current task progress based on the a=
mount of steps
done
=C2=A0=C2=A0 =C2=A0- display a progress in case of `wget` with extraction o=
f filename, size,
and downloaded from the output

The script is launching `make` by itself but the user is supposed to have
already done the configuration needed!

May be added later:
=C2=A0=C2=A0 =C2=A0- export raw output from `make` into a log file in /tmp =
or elsewhere
(command line option?)
=C2=A0=C2=A0 =C2=A0- add other trackable step like `wget`?
=C2=A0=C2=A0 =C2=A0- improve loglevel detection
=C2=A0=C2=A0 =C2=A0- any request from the team?!

Some images can be seen on my personal server:
=C2=A0=C2=A0 =C2=A0- the `--help` menu: https://naheulcraft.be/nextcloud/s/=
aX8fW5mK8dbXwqT
=C2=A0=C2=A0 =C2=A0- the progress tracking:
https://naheulcraft.be/nextcloud/s/87GK7yXQzZHydcj
=C2=A0=C2=A0 =C2=A0- the finished process: https://naheulcraft.be/nextcloud=
/s/ZPMt46WP5jib7mk

Signed-off-by: Rapha=C3=ABl Slagmolen (Tutul) <raphael.slagmolen@mailfence.=
com>
---
 DEVELOPERS                 |   3 +
 utils/make_rich_wrapper.py | 660 +++++++++++++++++++++++++++++++++++++
 2 files changed, 663 insertions(+)
 create mode 100755 utils/make_rich_wrapper.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 86e3f0e7b1..0c78d2f3a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3159,3 +3159,6 @@ F:=09package/quazip/
 F:=09package/shapelib/
 F:=09package/simple-mail/
 F:=09package/tinc/
+
+N:=09Rapha=C3=ABl Slagmolen (Tutul) <raphael.slagmolen@mailfence.com>
+F:=09utils/make_rich_wrapper.py
diff --git a/utils/make_rich_wrapper.py b/utils/make_rich_wrapper.py
new file mode 100755
index 0000000000..152b50be65
--- /dev/null
+++ b/utils/make_rich_wrapper.py
@@ -0,0 +1,660 @@
+#!/usr/bin/env python
+# -*- coding: utf-8 -*-
+
+'''
+    Date created: 2023/01/07
+    Date last modified: 2023/01/09
+    Python Version: 3.10+
+    Requirement:
+        packaging=3D=3D21+
+        rich=3D=3D13+
+'''
+
+__author__ =3D 'Tutul (https://gitlab.com/Tutul)'
+__copyright__ =3D 'Copyright 2023, make_rich_wrapper.py for Buildroot'
+__license__ =3D 'MIT'
+__credits__ =3D ['Tutul']
+__version__ =3D '1.0.0'
+__status__ =3D 'release'  # release > test > dev
+__maintainer__ =3D 'Tutul'
+__description__ =3D 'simple python script that act as a wrapper around `ma=
ke`
for Buildroot using the Rich module'
+
+import argparse
+import enum
+import logging
+import os
+import re
+import select
+import shutil
+import signal
+import subprocess
+from packaging import version
+from rich import box
+from rich.console import Console, Group
+from rich.live import Live
+from rich.logging import RichHandler
+from rich.panel import Panel
+from rich.prompt import Confirm
+from rich.progress import (
+    BarColumn,
+    DownloadColumn,
+    MofNCompleteColumn,
+    Progress, SpinnerColumn,
+    Task,
+    TaskProgressColumn,
+    TextColumn,
+    TimeElapsedColumn,
+    TimeRemainingColumn,
+    TransferSpeedColumn
+)
+from rich.table import Table
+
+##########################################################################=
##################
+
+
+class DownloadStep(enum.Enum):
+    """
+    Help to know wich downloading information is present
+    """
+    LENGTH =3D 0
+    OUTPUT =3D 1
+    PROGRESS =3D 2
+    DONE =3D 3
+
+##########################################################################=
##################
+
+
+class State(enum.Enum):
+    """
+    Buildroot Makefile's steps
+    """
+    READY =3D 0
+    DOWNLOADING =3D 1
+    EXTRACTING =3D 2
+    PATCHING =3D 3
+    CONFIGURING =3D 4
+    BUILDING =3D 5
+    INSTALLING =3D 6
+    DONE =3D 7
+
+    @staticmethod
+    def get_from_message(message) -> str:
+        if message.__contains__("Downloading"):
+            return State.DOWNLOADING
+        elif message.__contains__("Extracting"):
+            return State.EXTRACTING
+        elif message.__contains__("Patching"):
+            return State.PATCHING
+        elif message.__contains__("Configuring"):
+            return State.CONFIGURING
+        elif message.__contains__("Building"):
+            return State.BUILDING
+        elif message.__contains__("Installing"):
+            return State.INSTALLING
+        else:
+            return None
+
+##########################################################################=
##################
+
+
+class Task():
+    """
+    Keep track of the current step
+    """
+
+    def __init__(self, current_pkg_progress, step_progress,
pkg_steps_progress, downloader):
+        self.current_pkg_progress =3D current_pkg_progress
+        self.step_progress =3D step_progress
+        self.pkg_steps_progress =3D pkg_steps_progress
+        self.downloader =3D downloader
+
+        self.pkg_task_id =3D None
+        self.step_task_id =3D None
+        self.pkg_step_task_id =3D None
+        self.downloading_task_id =3D None
+        self.state =3D None
+        self.name =3D None
+
+    def __del__(self):
+        if self.pkg_task_id is not None:
+            self.current_pkg_progress.stop_task(self.pkg_task_id)
+            self.pkg_task_id =3D None
+        if self.step_task_id is not None:
+            self.step_progress.stop_task(self.step_task_id)
+            self.step_progress.update(self.step_task_id, visible=3DFalse)
+            self.step_task_id =3D None
+        if self.pkg_step_task_id is not None:
+            self.pkg_steps_progress.stop_task(self.pkg_step_task_id)
+            self.pkg_steps_progress.update(self.pkg_step_task_id,
visible=3DFalse)
+            self.pkg_step_task_id =3D None
+        if self.downloading_task_id is not None:
+            self.downloader.stop_task(self.downloading_task_id)
+            self.downloader.update(self.downloading_task_id, visible=3DFal=
se)
+            self.downloading_task_id =3D None
+        self.name =3D None
+        self.sate =3D State.DONE
+
+    def update(self, new_state, new_step=3DNone) -> None:
+        self.state =3D new_state
+
+        if self.downloading_task_id is not None and State.DOWNLOADING !=3D
self.state:
+            self.downloader.stop_task(self.downloading_task_id)
+            self.downloader.update(self.downloading_task_id, visible=3DFal=
se)
+            self.downloading_task_id =3D None
+
+        if self.step_task_id is not None:
+            self.step_progress.stop_task(self.step_task_id)
+            self.step_progress.update(self.step_task_id, visible=3DFalse)
+        if new_step is not None:
+            self.step_task_id =3D self.step_progress.add_task("", step=3Dn=
ew_step,
name=3Dself.name)
+        else:
+            self.step_task_id =3D None
+        if self.pkg_step_task_id is not None:
+            self.pkg_steps_progress.update(self.pkg_step_task_id,
completed=3Dself.state.value)
+
+    def next(self, new_name, new_state, new_step=3DNone) -> None:
+        if self.pkg_task_id is not None:
+            self.current_pkg_progress.stop_task(self.pkg_task_id)
+            self.current_pkg_progress.update(self.pkg_task_id,
description=3D"[bold green]%s done!" % self.name)
+
+        if self.step_task_id is not None:
+            self.step_progress.stop_task(self.step_task_id)
+            self.step_progress.update(self.step_task_id, visible=3DFalse)
+
+        if self.pkg_step_task_id is not None:
+            self.pkg_steps_progress.stop_task(self.pkg_step_task_id)
+            self.pkg_steps_progress.update(self.pkg_step_task_id,
visible=3DFalse)
+            self.pkg_step_task_id =3D None
+
+        if self.downloading_task_id is not None:
+            self.downloader.stop_task(self.downloading_task_id)
+            self.downloader.update(self.downloading_task_id, visible=3DFal=
se)
+            self.downloading_task_id =3D None
+
+        self.name =3D new_name
+        self.state =3D new_state
+
+        if self.state is not None:
+            self.step_task_id =3D self.step_progress.add_task("", step=3Dn=
ew_step,
name=3Dself.name)
+        if "Finishing" =3D=3D self.name:
+            self.pkg_task_id =3D self.current_pkg_progress.add_task("%s" %
self.name)
+        else:
+            self.pkg_step_task_id =3D self.pkg_steps_progress.add_task("",
total=3DState.DONE.value, name=3Dself.name)
+            self.pkg_task_id =3D self.current_pkg_progress.add_task("Worki=
ng on
%s" % self.name)
+
+##########################################################################=
##################
+
+
+def handle_task_update(current, message) -> bool:
+    """
+    Handle step update and detect task switching
+    """
+    finished =3D False
+    message_array =3D message.split(">>> ")[1].split(" ")
+
+    name =3D "[b]" + message_array[0] + "[/b]"
+    if len(message_array) >=3D 3:
+        name =3D name + " " + message_array[1]
+        step =3D message_array[2:]
+    else:
+        step =3D message_array[1:]
+    if message.__contains__(">>>   "):
+        name =3D "Finishing"  # Reset for the last few tasks
+
+    step =3D ' '.join(str(x) for x in step)
+    state =3D State.get_from_message(step)
+
+    if current.name is None:
+        current.next(name, state, step)
+    elif name !=3D current.name:
+        finished =3D True
+        current.update(State.DONE)
+        if state is None:
+            state =3D State.READY
+        current.next(name, state, step)
+    elif state is None:
+        state =3D current.state
+
+    current.update(state, step)
+    return finished
+
+##########################################################################=
##################
+
+
+def handle_downloading(current, message, step) -> None:
+    """
+    Handle all that is about downloading (wget only for now)
+    """
+
+    log.debug(message)
+
+    if current.downloading_task_id is None:
+        current.downloading_task_id =3D current.downloader.add_task("",
total=3DNone, filename=3D"?")
+
+    if DownloadStep.LENGTH =3D=3D step:
+        current.downloader.update(current.downloading_task_id,
total=3Dint(message.split("Length: ")[1].split(" (")[0]))
+    elif DownloadStep.OUTPUT =3D=3D step:
+        current.downloader.update(current.downloading_task_id,
filename=3Dmessage.split("output' '")[1])
+    elif DownloadStep.PROGRESS =3D=3D step:
+        if message.__contains__(" ."):
+            downloaded_size =3D message.split(" .")[0]
+        else:
+            downloaded_size =3D message.split("                           =
     =20
                     ")[0]
+        downloaded_size.strip().upper().replace("O", "").replace("B",
"").replace("I", "")
+        if downloaded_size.__contains__("K"):
+            downloaded_size =3D int(downloaded_size.replace("K", "")) * 10=
00
+        elif downloaded_size.__contains__("M"):
+            downloaded_size =3D int(downloaded_size.replace("M", "")) * 10=
00000
+        elif downloaded_size.__contains__("G"):
+            downloaded_size =3D int(downloaded_size.replace("G", "")) *
1000000000
+        elif downloaded_size.__contains__("T"):
+            downloaded_size =3D int(downloaded_size.replace("T", "")) *
1000000000000
+        current.downloader.update(current.downloading_task_id,
completed=3Dint(downloaded_size))
+    elif DownloadStep.DONE =3D=3D step:
+        current.downloader.stop_task(current.downloading_task_id)
+        current.downloader.update(current.downloading_task_id, visible=3DF=
alse)
+        current.downloading_task_id =3D None
+
+##########################################################################=
##################
+
+
+def which(exec_name, package=3DNone, desired_version=3DNone,
version_tuple_catcher=3DNone, path=3DNone) -> bool:
+    """
+    Used to find if a binary is present (and usable) on the system
+    Can also check for minimal version (as long as the binary use --versio=
n)
+    And may also check if the path is the required one
+    """
+    global console
+    if package is None:
+        package =3D exec_name
+
+    p =3D shutil.which(exec_name)
+    if p is None:
+        console.print(f"    [red1]:cross_mark: [b]{package}[/b] is require=
d
but cannot find it in the PATH")
+        return False
+    elif path is not None and path !=3D p:
+        console.print(
+            f"    [orange_red1]:no_entry: [b]{package}[/b] is found but we
need it to be in a specific location: {p} --> {path}")
+        return False
+    elif desired_version is not None:
+        if version_tuple_catcher is not None:
+            local_version =3D subprocess.run([p, "--version"],
stdout=3Dsubprocess.PIPE, check=3DTrue,
+                                         =20
text=3DTrue).stdout.split(version_tuple_catcher[0])[1].split(version_tuple_=
catcher[1])[0]
+            if version.parse(local_version) < version.parse(desired_versio=
n):
+                console.print(
+                    f"    [orange1]:exclamation_mark: [b]{package}[/b] is
found but we require at least the version {desired_version} and you have th=
e
version {local_version}")
+                return False
+        else:
+            console.print(
+                f"    [orange1]:exclamation_mark: [b]{package}[/b] is foun=
d
but we require at least the version {desired_version}")
+            return False
+    console.print(f"    [green4]:heavy_check_mark:  [b]{package}[/b] is fo=
und
and usable")
+    return True
+
+##########################################################################=
##################
+
+
+def test_depencencies(tools_list) -> bool:
+    """
+    Simply handle calling which() from a list of tools
+    """
+    is_all_ok =3D True
+    for tool in tools_list:
+        if not which(tool[0], tool[1], tool[2], tool[3], tool[4]):
+            is_all_ok =3D False
+    return is_all_ok
+
+##########################################################################=
##################
+
+
+# which(binary), package[binary], minimal version, version_tuple_catcher,
required path
+build_tools_list =3D [
+    ("which", None, None, None, None),
+    ("sed", None, None, None, None),
+    ("make", None, "3.81", ("GNU Make ", "\n"), None),
+    ("ld", "binutils", None, None, None),
+    ("diff", "diffutils", None, None, None),
+    ("gcc", None, "4.8", ("gcc (GCC) ", "\n"), None),
+    ("g++", None, "4.8", ("g++ (GCC) ", "\n"), None),
+    ("bash", None, None, None, None),
+    ("patch", None, None, None, None),
+    ("gzip", None, None, None, None),
+    ("bzip2", None, None, None, None),
+    ("perl", None, "5.8.7", (" (v", ") built for"), None),
+    ("tar", None, None, None, None),
+    ("cpio", None, None, None, None),
+    ("unzip", None, None, None, None),
+    ("rsync", None, None, None, None),
+    ("file", None, None, None, "/usr/bin/file"),
+    ("bc", None, None, None, None),
+    ("find", "findutils", None, None, None)
+]
+source_fetching_tools_list =3D [
+    ("wget", None, None, None, None)
+]
+
+
+def check_requirements() -> bool:
+    """
+    Manage the display and checking for the required tools, stop if any is
missing
+    """
+    global console
+    requirements_ok =3D True
+    console.print("Mandatory packages:")
+    with console.status("[blue]Looking for mandatory packages...") as stat=
us:
+        console.print("  [i]Build tools:")
+        requirements_ok =3D test_depencencies(build_tools_list) and
requirements_ok
+        console.print("  [i]Source fetching tools:")
+        requirements_ok =3D test_depencencies(source_fetching_tools_list) =
and
requirements_ok
+    if not requirements_ok:
+        console.print("\nMandatory program are [u]missing[/u]")
+        console.print("you must install them before retrying!")
+    return requirements_ok
+
+##########################################################################=
##################
+
+
+recommanded_dependencies_list =3D [
+    ("python", None, "2.7", ("Python ", "\n"), None)
+]
+configuration_interface_dependencies_list =3D [
+    ("ncursesw5-config", "ncurses5", None, None, None),  # menuconfig
+    ("qtdiag-qt5", "qt5", None, None, None),  # xconfig
+    ("glib-compile-schemas", "glib2", None, None, None),  # gconfig
+    ("gtk-launch", "gtk2", None, None, None),  # gconfig
+    ("glade", "glade2", None, None, None)  # gconfig
+]
+opt_source_fetching_tools_list =3D [
+    ("bzr", "bazaar", None, None, None),
+    ("cvs", None, None, None, None),
+    ("git", None, None, None, None),
+    ("hg", "mercurial", None, None, None),
+    ("scp", None, None, None, None),
+    ("sftp", None, None, None, None),
+    ("svn", "subversion", None, None, None)
+]
+java_related_packages_list =3D [
+    ("javac", None, None, None, None),
+    ("jar", None, None, None, None)
+]
+documentation_generation_tools_list =3D [
+    ("asciidoc", None, "8.6.3", ("asciidoc ", "\n"), None),
+    ("w3m", None, None, None, None),
+    ("dblatex", None, None, None, None)  # Only for PDF manual
+]
+graph_generation_tools_list =3D [
+    ("gvgen", "graphviz", None, None, None)
+]
+
+
+def check_optional_packages() -> bool:
+    """
+    Manage the display and checking for the optional tools, continue with =
a
warning if any is missing
+    """
+    global console
+    opt_ok =3D True
+    console.print("Optional packages:")
+    with console.status("[blue]Looking for optional packages...") as statu=
s:
+        console.print("  [i]Recommended dependencies:")
+        opt_ok =3D test_depencencies(recommanded_dependencies_list) and op=
t_ok
+        console.print("  [i]Configuration interface dependencies:")
+        opt_ok =3D test_depencencies(configuration_interface_dependencies_=
list)
and opt_ok
+        console.print("  [i]Source fetching tools:")
+        opt_ok =3D test_depencencies(opt_source_fetching_tools_list) and o=
pt_ok
+        console.print("  [i]Java-related packages, if the Java Classpath n=
eeds
to be built for the target system:")
+        opt_ok =3D test_depencencies(java_related_packages_list) and opt_o=
k
+        console.print("  [i]Documentation generation tools:")
+        opt_ok =3D test_depencencies(documentation_generation_tools_list) =
and
opt_ok
+        console.print("  [i]Graph generation tools:")
+        opt_ok =3D test_depencencies(graph_generation_tools_list) and opt_=
ok
+        console.print(
+            "    [gray39]:interrobang:  [b]python-matplotlib[/b] cannot be
detected automaticly. Check your distribution's repositories or [i]pip[/i]"=
)
+    if not opt_ok:
+        console.print("\n>>> Some optional program are [u]missing[/u], som=
e
functionalities may not compile or be incomplete")
+    return opt_ok
+
+##########################################################################=
##################
+
+
+# skeleton (4): host-skeleton && skeleton-init-common &&
skeleton-init-(sysv|systemd|openrc|none) && skeleton
+# toolcahin (2): toolchain && toolchain-buildroot
+# gcc(+1): gcc become host-gcc-initial and host-gcc-final
+# various (~4): host-makedevs && ifupdown-scripts && initscripts &&
urandom-scripts
+# +1 for the last task (finalizing host/target directory, sanitizing RPATH=
,
generating root filesystems and image rootfs)
+# BUT.... in some case this number isn't quit exact (especially the 'vario=
us'
section)
+extra_packages_to_count =3D 12
+
+
+def load_all_tasks() -> None:
+    """
+    Load the external deps on witch we need to work for this run
+    if an error occure, it's probably because the user didn't do any `make
menuconfig`
+    """
+    global total_pkgs
+    global console
+    with console.status("[bold]Loading config, requested packages and
dependencies[/bold] (did you run `[blue]make menuconfig[/blue]`?)",
spinner=3D"aesthetic") as status:
+        external_deps =3D subprocess.run(["make", "external-deps"],
stdout=3Dsubprocess.PIPE, check=3DTrue, text=3DTrue)
+    raw_pkgs_list =3D external_deps.stdout.splitlines()
+
+    # Do some cleaning because all the patches files aren't packages
+    regex =3D re.compile(r'^.*\.patch.*$')
+    total_pkgs =3D [p for p in raw_pkgs_list if not regex.match(p)]
+
+    console.print("In total", (len(total_pkgs) + extra_packages_to_count),
"packages will be processed for this buildroot")
+
+##########################################################################=
##################
+
+
+def main() -> None:
+    # Track the averall progress
+    pkgs_progress =3D Progress(
+        TimeElapsedColumn(),
+        TextColumn("[blue]{task.description}"),
+        BarColumn(complete_style=3D'slate_blue1'),
+        MofNCompleteColumn(),
+        TaskProgressColumn()
+    )
+    # Track the current progress and stay after completion
+    current_pkg_progress =3D Progress(
+        TimeElapsedColumn(),
+        TextColumn("{task.description}")
+    )
+    # Progress bars for single pkg steps (will be hidden when step is done=
)
+    step_progress =3D Progress(
+        TextColumn("     "),
+        SpinnerColumn(),
+        TextColumn("[bold purple]{task.fields[step]}")
+    )
+    # Progress bar for current pkg (progress in steps)
+    pkg_steps_progress =3D Progress(
+        TextColumn("[bold cyan]Progress for pkg {task.fields[name]}"),
+        SpinnerColumn("simpleDotsScrolling"),
+        TextColumn("({task.completed} of {task.total} steps done)"),
+    )
+    # Track any downloading
+    downloader_progress =3D Progress(
+        TextColumn("[bold]{task.fields[filename]}", justify=3D"right"),
+        BarColumn(bar_width=3DNone, complete_style=3D"dark_magenta",
pulse_style=3D"medium_purple"),
+        "[progress.percentage]{task.percentage:>3.1f}%",
+        "=E2=80=A2",
+        DownloadColumn(),
+        "=E2=80=A2",
+        TransferSpeedColumn(),
+        "=E2=80=A2",
+        TimeRemainingColumn()
+    )
+
+    # group of progress bars;
+    # some are always visible, others will disappear when progress is
complete
+    working_panel =3D Panel(Group(current_pkg_progress, step_progress,
pkg_steps_progress, downloader_progress), box=3Dbox.SIMPLE_HEAD)
+    progress_group =3D Group(
+        working_panel,
+        pkgs_progress
+    )
+
+    pkgs_task_id =3D pkgs_progress.add_task("Packages", total=3D(len(total=
_pkgs) +
extra_packages_to_count))
+    cached =3D None
+    overflow =3D None
+
+    # use own live instance as context manager with group of progress bars=
,
+    # which allows for running multiple different progress bars in paralle=
l,
+    # and dynamically showing/hiding them
+    with Live(progress_group):
+        # Current task
+        pkg =3D Task(current_pkg_progress=3Dcurrent_pkg_progress,
step_progress=3Dstep_progress,
+                   pkg_steps_progress=3Dpkg_steps_progress,
downloader=3Ddownloader_progress)
+
+        # Prepare the call to `make`
+        modified_env =3D os.environ.copy()
+        modified_env["LANG"] =3D "C"
+        log.debug(f"Using modified encironment: {modified_env}")
+        process =3D subprocess.Popen(
+            'make',
+            env=3Dmodified_env,
+            stdout=3Dsubprocess.PIPE,
+            stderr=3Dsubprocess.STDOUT,
+            text=3DTrue,
+            close_fds=3DTrue)
+
+        # Loop as long as the process is running
+        while process.poll() is None:
+            # Wait for something to read from stdout or stderr
+            _, _, _ =3D select.select([process.stdout.fileno()], [], [])
+            read =3D process.stdout.readline()
+
+            # Detect each step
+            if read.__contains__("[7m>>>"):
+                if handle_task_update(pkg, read):
+                    pkgs_progress.advance(pkgs_task_id, advance=3D1)
+            # Handles all WGET downloading steps
+            elif re.search("Length: [0-9]+ \([0-9ioObBkKmMgGtT.,]+\)", rea=
d):
+                handle_downloading(pkg, read, DownloadStep.LENGTH)
+            elif re.search("wget -.*output' '.*'", read):
+                handle_downloading(pkg, read, DownloadStep.OUTPUT)
+            elif re.search("[0-9kKmMgGtTioObB.,]+ [. ]+ [0-9]+%", read):
+                handle_downloading(pkg, read, DownloadStep.PROGRESS)
+            elif re.search("[0-9-/pPaAmM ]+ \([0-9., kKmMgGtTbBoOiI\/]+s\)=
 -
.* saved", read):
+                handle_downloading(pkg, read, DownloadStep.DONE)
+            # Handles auto-detect for logging level
+            elif re.search("[\] ]{1}(EXCEPTION|EMERGENCY|EMERG)[\]: ]{1}",
read.upper()):
+                log.exception(read)
+            elif re.search("[\] ]{1}(CRITICAL|CRIT|FATAL|ALERT)[\]: ]{1}",
read.upper()):
+                log.critical(read)
+            elif re.search("[\] ]{1}(ERROR|ERR)[\]: ]{1}", read.upper()):
+                log.error(read)
+            elif re.search("[\] ]{1}(WARNING|WARN)[\]: ]{1}", read.upper()=
):
+                log.warning(read)
+            elif re.search("[\] ]{1}(DEBUG|TRACE)[\]: ]{1}", read.upper())=
:
+                log.debug(read)
+            elif read:
+                log.info(read)
+
+        # Clean the "current" progress bar
+        del pkg
+
+        # We may need to fix this progress depending of the untrackable ta=
sks
that may be badly accounted for earlier
+        pkgs_task =3D [t for t in pkgs_progress.tasks if t.id =3D=3D
pkgs_task_id][0]
+        if pkgs_task.completed < pkgs_task.total:
+            cached =3D pkgs_task.total - pkgs_task.completed
+            pkgs_progress.update(pkgs_task_id, completed=3D(pkgs_task.tota=
l),
advance=3D1)
+        elif pkgs_task.completed > pkgs_task.total:
+            overflow =3D pkgs_task.completed - pkgs_task.total
+            pkgs_progress.update(pkgs_task_id, total=3Dpkgs_task.completed=
,
completed=3D(pkgs_task.completed), advance=3D1)
+        pkgs_progress.refresh()
+    if cached is not None:
+        console.print(f"[spring_green3][b]{cached}[/b] pkg(s) loaded from
[i]cache")
+    if overflow is not None:
+        console.print(f"[deep_pink2 b]{overflow} unacounted pkg(s) added t=
o
our workload")
+    console.print("Work is done :relieved_face:")
+
+##########################################################################=
##################
+
+
+def handle_sigint(signum, frame) -> None:
+    console.print("Interrupted by the user")
+    quit()
+
+
+signal.signal(signal.SIGINT, handle_sigint)
+
+##########################################################################=
##################
+
+if __name__ =3D=3D '__main__':
+    parser =3D argparse.ArgumentParser(
+        prog=3D"make_rich_wrapper.py",
+        description=3Df"{__description__}",
+        epilog=3Df"{__copyright__}, {__author__}, license: {__license__}"
+    )
+    parser.add_argument('-l', '--loglevel',
+                        help=3D'set the verbosity level for the logs print=
ed on
the screen',
+                        type=3Dstr,
+                        choices=3D["all", "debug", "info", "warn", "error"=
,
"critical"],
+                        default=3D"error")
+    group =3D parser.add_mutually_exclusive_group()
+    group.add_argument('-f', '--fast',
+                       help=3D'disable the requirements and optionnal chec=
k
before running',
+                       action=3D'store_true')
+    group.add_argument('--only-check',
+                       help=3D'only do the requirements and optionnal chec=
k and
exit',
+                       action=3D'store_true')
+    parser.add_argument('--check-optional',
+                        help=3D'enable checking for optional ressources an=
d
exit',
+                        action=3D'store_true')
+    parser.add_argument('--version',
+                        help=3D'output version information and exit',
+                        action=3D'version',
+                        version=3Df'%(prog)s {__version__} - {__status__}'=
)
+    parser.add_argument('--about',
+                        help=3D'output about information and exit',
+                        action=3D'store_true')
+
+    arguments =3D parser.parse_args()
+
+    if arguments.about:
+        console =3D Console(highlight=3DFalse)
+        console.print(f"{__copyright__}\nCreated by {__author__}, license:
{__license__}\n\n{__description__}\n")
+        if "release" =3D=3D __status__:
+            console.print(f"[green b]{__status__}")
+        elif "test" =3D=3D __status__:
+            console.print(f"[cyan]{__status__}")
+        elif "dev" =3D=3D __status__:
+            console.print(f"[purple i]{__status__}")
+        else:
+            console.print(f"[red u]{__status__}")
+        console.print(f"Version: {__version__}\nMaintainer:
{__maintainer__}\n\nCredits: {__credits__}")
+        quit()
+
+    # Initialise the rich console for printing
+    console =3D Console()
+
+    # Initialing the rich log handler
+    logging.basicConfig(
+        level=3Darguments.loglevel.upper().replace("ALL",
"NOTSET").replace("WARN", "WARNING"),
+        format=3D"%(message)s",
+        datefmt=3D"[%X]",
+        handlers=3D[RichHandler(rich_tracebacks=3DTrue, show_path=3DFalse)=
]
+    )
+    log =3D logging.getLogger("rich")
+
+    if not arguments.fast:
+        ok =3D check_requirements()
+        if not arguments.only_check:
+            if ok:
+                console.rule(style=3D"green")
+            else:
+                quit()
+
+    if not arguments.fast and arguments.check_optional:
+        ok =3D check_optional_packages()
+        if not arguments.only_check:
+            if ok:
+                console.rule(style=3D"blue")
+            else:
+                console.rule(style=3D"magenta")
+
+    if not arguments.only_check:
+        load_all_tasks()
+        if not arguments.fast and not Confirm.ask("Proceed? (it may take s=
ome
times)", console=3Dconsole, default=3D"y"):
+            quit()
+        console.print("\n\n")
+        main()
--=20
2.39.0

----
De: raphael.slagmolen@mailfence.com
=C3=80: buildroot@buildroot.org, raphael.slagmolen@mailfence.com
9 janv. 2023 15:57:48

----
De: raphael.slagmolen@mailfence.com
=C3=80: buildroot@buildroot.org
9 janv. 2023 16:22:52
------=_Part_270410_71280179.1673277779706
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature
Content-Disposition: attachment

-----BEGIN PGP SIGNATURE-----
Version: CO
Comment: CO

wnUEARYKAAYFAmO8MVMAIQkQrN+Jdt0fs44WIQRE1d/Juv0brx2kJnas34l2
3R+zjpMtAP9wPmEf2bMVMDbU250YAJLorlI7aZ8LEpxifzD3REw+MAD/Zpso
6ZXSFAWbauXi/LnBCHWEQ+cCa4jlRX/C8O/9MQ4=
=9Rr2
-----END PGP SIGNATURE-----

------=_Part_270410_71280179.1673277779706--

--===============8186663050281503317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8186663050281503317==--
