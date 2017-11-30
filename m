From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 13:57:21 +0100
Subject: [Buildroot] [PATCH 7/8] package/asterisk: add comment about a
 check-package false positive
In-Reply-To: <1054252197.2705387.1512040781069.JavaMail.zimbra@datacom.ind.br>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
 <20171130090057.2d034d10@windsurf.home>
 <1054252197.2705387.1512040781069.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20171130135721.6e923d32@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for looking into it so quickly!

On Thu, 30 Nov 2017 09:19:41 -0200 (BRST), Ricardo Martincoski wrote:

> We can use something like this (not fully tested yet!):
> 
> +++ utils/checkpackagelib/lib_mk.py
> @@ -219 +219 @@ class UselessFlag(_CheckFunction):
> -        if self.DEFAULT_AUTOTOOLS_FLAG.search(text):
> +        if self.DEFAULT_AUTOTOOLS_FLAG.search(text) and not text.lstrip().startswith("HOST_"):
> 
> Avoiding false warnings is more important than testing for all corner
> cases IMO. Using the code above we don't issue a valid warning for
> rare cases, we stop issuing a false warning and we also keep O(n).

Yeah, if you want to test this properly, it's more difficult. Just
AUTORECONF = NO is redundant. Just HOST_AUTORECONF = NO is redundant.
But the combination of AUTORECONF = YES + HOST_AUTORECONF = NO is valid.

So basically for all variables that have inheritance between target
and host, having the host variant of the variable set the variable
value back to its default is correct if the target variable is set.

So, your approach at least works, and will not generate false warnings.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
