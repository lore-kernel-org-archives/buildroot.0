From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat,  2 Dec 2017 02:28:24 -0200
Subject: [Buildroot] [PATCH 1/1] check-package: avoid false warning of
 useless flag
In-Reply-To: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
References: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <1512188904-31366-1-git-send-email-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just AUTORECONF = NO is redundant.
Just HOST_AUTORECONF = NO is redundant.
But the combination of AUTORECONF = YES + HOST_AUTORECONF = NO is valid.

So basically for all variables that have inheritance between target and
host, having the host variant of the variable set the variable value
back to its default is correct if the target variable is set.

Instead of increasing complexity of the script to fully detect this
case, ignore the host flag set to its default value as it can be
overriding a non-default value inherited from the equivalent target
flag.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Part of commit log copied from Thomas' e-mail. I hope you don't mind.
---
 utils/checkpackagelib/lib_mk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 6ed6011..817e809 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -216,7 +216,7 @@ class UselessFlag(_CheckFunction):
                     .format(self.filename, lineno, self.url_to_manual),
                     text]
 
-        if self.DEFAULT_AUTOTOOLS_FLAG.search(text):
+        if self.DEFAULT_AUTOTOOLS_FLAG.search(text) and not text.lstrip().startswith("HOST_"):
             return ["{}:{}: useless default value "
                     "({}#_infrastructure_for_autotools_based_packages)"
                     .format(self.filename, lineno, self.url_to_manual),
-- 
2.7.4
