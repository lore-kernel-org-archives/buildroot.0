From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 09:14:18 +0100
Subject: [Buildroot] [PATCH 1/3] dependencies: bail out if makeinfo isn't
	found
In-Reply-To: <cover.1260951255.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260951255.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8dba09de9d62422167164df0038d7d7cf062a252.1260951255.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

makeinfo is mandatory at least to build a toolchain. Currently,
dependencies.sh doesn't fail if makeinfo is not present and only
displays a message that can easily be lost. The user will then
encounter the issue later, when it is more difficult to understand
what's happening.

So, this patch simply does for makeinfo what the script does for the
other dependencies: bail out if they aren't available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.sh |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index a3ee111..e503097 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -308,6 +308,7 @@ if ! which makeinfo > /dev/null ; then \
 	/bin/echo -e "\n\nMost likely some packages will fail to build their documentation"
 	echo "Either install 'makeinfo' on your host or fix the respective packages."
 	echo "Makeinfo can usually be found in the texinfo package for your host."
+	exit 1
 else
 	echo "makeinfo installed:				Ok"
 fi
-- 
1.6.3.3
