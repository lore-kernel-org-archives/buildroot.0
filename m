From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 May 2012 23:22:44 +0200
Subject: [Buildroot] autobuild: group similar failures
Message-ID: <201205142322.44867.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Today, the autobuild logs are displayed on http://autobuild.buildroot.org/
and provide access to all the build logs, whether they were a successful
build, or there was a failure.

Although successful builds are nice, the interesting logs are those that
relate to build failures. Having the ability to sort and categorise those
failed logs would hopefully help in solving the most common build failures.

For example, in the recent past, there were two related alsa-libs build
failures on PowerPC:
  http://autobuild.buildroot.net/results/a8471598a379e5dbecef539479b968947474ef22/
  http://autobuild.buildroot.net/results/05b306ee2fa909420e4bc1f9faa7a35d17d786a7/

I did not look in details, but it may well be that there are other similar
build failures of alsa-libs on PowerPC. Solving the error in one of those
builds would also solve the other(s).

So, we need a heuristic to detect how similar two failed build logs are, and
eventually group those failures together. Below is such simple heuristic:

 1- extract the last 100 lines-or-so from two build logs (already done)
 2- sort each extract
 3- diffstat the sorted extracts
 4- the lower the number of different lines, the higher the similarity

For example, for these two build logs:
  diff -du a847159-100.sorted 05b306e-100.sorted |diffstat 
  05b306e-100.sorted |   18 +++++++++---------
   1 file changed, 9 insertions(+), 9 deletions(-)

Which is 18 changed lines out of 200, for a difference score of 9%. This is
a really rough and dumb metric, but one that is easy to compute, and we can
easily refine it a little bit (eg. by using more lines in the extracts, or
by munging some well-known patterns).

Setting up the scripts that gather all failed logs, and compute that
similiarity scores would be relatively easy (and I can do it!).

We could of course use other metrics, such as true text similarity as used
for plagiarism detection, but they would IMHO be much more involved.

Ready to read comments and suggestions! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
