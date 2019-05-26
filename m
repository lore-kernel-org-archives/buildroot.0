From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 13:05:06 +0200
Subject: [Buildroot] [PATCH 8/8] utils/check-package: warn about
 overridden variables
In-Reply-To: <20190526092049.GI12162@scaer>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-9-ricardo.martincoski@gmail.com>
 <20190526092049.GI12162@scaer>
Message-ID: <cbb6321c-6eac-e8a2-0d23-1e6a9adde07c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/05/2019 11:20, Yann E. MORIN wrote:
[snip]
> However, when I fix all these 82 new errors, and run check-package, I
> now get a warning about overriden license lists in the few packages
> where we do override the license, like in dtc:
> 
>     ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
>     DTC_LICENSE := $(DTC_LICENSE), GPL-2.0+ (programs)
>     [...]
>     endif

 This should not trigger an error (which is actually a bug in check-package, but
that's a different issue). check-package code is:

        if self.conditional == 0:
            ...
        else:
            if variable not in self.unconditionally_set:
                self.conditionally_set.append(variable)
                return

i.e. because we're now in a conditional, and the variable was unconditionally
assigned before, it's just added to conditionally_set without further checking.

 I don't see how replacing \s by \\s (or putting r in front of the string, which
is equivalent) could change that behaviour. Except maybe the
START_CONDITIONAL/END_CONDITIONAL REs are no longer correct?


> However, as far as I understand the code, there is an explicit condition
> that allows concatenating to a variable (the CONCATENATING regexp), now
> line 127.

 Note that if you put an r in front, you have to replace \\ by \ again.
CONCATENATING has \\1...

 Regards,
 Arnout

> 
> Do you have an idea what's going on now?
> 
> Regards,
> Yann E. MORIN.
> 
