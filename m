From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Oct 2016 11:09:14 +0200
Subject: [Buildroot] [PATCH] pkg-download: fix fetching URLs with ? from
	PRIMARY/SECONDARY
In-Reply-To: <20161022150413.25a85c1c@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 22 Oct 2016 15:04:13 +0200")
References: <20161021202715.16528-1-arnout@mind.be>
 <20161022150413.25a85c1c@free-electrons.com>
Message-ID: <87d1iro2it.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > There is nothing named "SECONDARY" in Buildroot, it's called "BACKUP".
 > This can be fixed when applying the patch.

 > On Fri, 21 Oct 2016 22:27:15 +0200, Arnout Vandecappelle
 > (Essensium/Mind) wrote:
 >> Some packages download files (especially patches) with a ? in the
 >> URL. The ? marks the query part of the URL. However, the downloaded
 >> file still contains the ? but from then on it doesn't designate a
 >> query part anymore. Therefore, when fetching from PRIMARY or
 >> SECONDARY site over http, the server will report a 404 Not Found.
 >> 
 >> To fix, we need to replace the ? with %3F. Obviously, this should
 >> be done only when fetching from PRIMARY or SECONDARY. For fetching
 >> from the real upstream, the ? really does designate the query part.

 > One thing I'm wondering is if the '?' character is the only one that
 > needs to be escaped like this, or not.

I believe it is, as we already quote the URLs correctly so they don't
confuse the shell and wget afaik correctly URL encodes URL before
requesting the location from the web server.

It works here at least with lighttpd:

echo ok > '/var/www/url?with&special!characters in'

wget 'http://127.0.0.1/url?with&special!characters in'
--2016-10-23 11:04:49--  http://127.0.0.1/url?with&special!characters%20in
Connecting to 127.0.0.1:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2016-10-23 11:04:49 ERROR 404: Not Found.

wget 'http://127.0.0.1/url%3fwith&special!characters in'
--2016-10-23 11:04:27--  http://127.0.0.1/url%3fwith&special!characters%20in
Connecting to 127.0.0.1:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3 [application/octet-stream]
Saving to: ?url?with&special!characters in?

2016-10-23 11:04:27 (316 KB/s) - ?url?with&special!characters in? saved [3/3]


We have seen this problem on sources.buildroot.org as well. I have so
far manually fixed it up by renaming the files to drop ?.., so that will
need to be undone when this gets applied.

-- 
Bye, Peter Korsgaard
