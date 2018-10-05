From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 13:31:57 +0200
Subject: [Buildroot] [PATCH v2] Fix issue with printvars executing giant
 shell command
In-Reply-To: <20180917181054.14616-1-tpiepho@impinj.com> (Trent Piepho's
 message of "Mon, 17 Sep 2018 11:10:54 -0700")
References: <20180917181054.14616-1-tpiepho@impinj.com>
Message-ID: <87d0so7hoy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 > The underlying problem is that $(foreach V,1 2 3,) does not evaluate to
 > an empty string.  It evaluates to "? ", three empty strings separated by
 > whitespace.

 > A construct of this format, with a giant list in the foreach, is part of
 > the printvars command.  This means that "@:$(foreach ....)", which is
 > intended to expand to a null command, in fact expands to "@:       "
 > with a great deal of whitespace.  Make chooses to execute this command
 > with:
 >     execve("/bin/sh", ["/bin/sh", "-c", ":       "]

 > But with far more whitespace.  So much that it can exceed shell command
 > line length limits.

 > This solution is to move the foreach to another step in the recipe.  The
 > "@:" is retained as the first line so the recipe is not Empty, which
 > would cause a change in make behavior when make builds the target.  The
 > 2nd line, all whitespace, will be skipped by make.

 > Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
