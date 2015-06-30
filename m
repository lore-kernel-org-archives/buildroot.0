From: Andreas Naumann <dev@andin.de>
Date: Tue, 30 Jun 2015 22:26:28 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <1581556904.2327180.1435653528950.JavaMail.root@openwide.fr>
References: <1581556904.2327180.1435653528950.JavaMail.root@openwide.fr>
Message-ID: <5592FB74.3010608@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Jeremy,

here is my first shot:
https://bitbucket.org/anaum/br_robot

For now I have implemented building a config and running the ext2/3/4 
filesystem checks. Didnt get around doing the qemu part yet, but it 
should be enough to get the idea. Just follow the README.
Install the RIDE editor if you can, even though it crashes sometimes it 
makes the structure very clear and provides additional debug output 
while executing the tests.

Also I have not invested in test documentation, but look at the 
report/log.html and see if that's suitable. Comments on other 
interesting features below...


>> syntax you have to learn, while Python is known by a large number of
>> people already.
True to some extend, and I must admit that the variable syntax takes a 
little getting used to.
But besides that the API documentation for the libraries is very good 
and what's more, if you use RIDE editor to write the testcases (which I 
do almost exclusively), you hardly have to worry about the syntax. It 
works a bit Excel-like, suggests keywords and shows their documentation 
in a tooltip when pressing CTRL). Helps in navigation from testcases to 
keyword implementation, does global rename...


> pretty good, RFW can report in an xunit-compatible xml which can be
> easily parsed by whatever tool you prefer. I have been autogenerating
> reports with it for quite some time

I'd be interested, how is that different from the report.html that you 
mention below? What tools are you using?

> RFW also generates some HTML pages ready to be pushed on a server,
> but that's less usefull for the buildroot use-case.

On feature that I really like is the html linkage of the test report to 
the log, so often it's possible to find the problematic spot without 
digging through ascii-logfiles. Have a look at that and maybe make a 
testcase fail.
>
>> Can it run tests in parallel?
>
> no, RFW core has no parallel testing capabilities by itself. There
> are plugins to do that, though...

Well I havnt looked at any parallel plugin, but you can start the pybot 
execution as often as you like. It's just a matter of defining different 
tests for different runs. I think the tagging feature helps a lot with 
that. E.g. each package specific tests would be tagged with their 
package name and then you would have a run for each tag starting with 
a*, b*, ... so about 26 threads running side by side.
Another solution could be running each suite separatly.

There's a tool called rebot which can be used to combine the results 
(output.xml) of the different runs.

And there's an option in pybot to run just tests that either failed or 
have not been executed in a previous run (using the previous output.xml).

>> Can we
>> easily integrate the tests with Jenkins to have them run everyday?

The jenkins plugin works great, we use it in combination with jenkins 
matrix jobs to get the parallelization. At the moment we run about 10 
different targets in our testbed, but they mostly do the same tests with 
different configuration data. Anyway there's a job at the end that 
accumulates all the results into one report.

And finally we are interested in getting more coverage in that report as 
well as we would be able to provide results from real HW instead of qemu 
only. So of course I'd be happy to see a way of integrating buildroots 
test with our system...


regards,
Andreas
