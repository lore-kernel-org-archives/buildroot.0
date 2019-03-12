From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 10:57:47 +0100
Subject: [Buildroot] 2019.02 performance
In-Reply-To: <20190312090518.692f21a9@windsurf>
References: <1552341542.7410.20.camel@impinj.com>
 <20190312090518.692f21a9@windsurf>
Message-ID: <76ace55f-4b7d-5601-0927-fb9f7c144b18@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 09:05, Thomas Petazzoni wrote:
> For the other ones, I don't immediately see any easy optimization
> route, except perhaps writing some dedicated C programs instead of
> using the slower shell scripts forking like crazy.

 Assuming check-bin-arch becomes the dominant one when we use the pkg-file-list
for check_host_rpath, I've taking a look at how crazy this script is forking.
The script itself is executed once per package, which doesn't sound excessive.
It then forks a single sed to get the files for the package, and for each
non-ignored file it does a readelf, a sed and a head. This doesn't sound
excessive either...

 So the only thing I can think of, is to create a small C program that reads the
first 4 bytes of a file and checks if it is .ELF, to avoid the readelf+sed+head.
Doesn't sound like it would make that much of a difference...

 We could also use the .files-list*.txt which contains only the files belonging
to the package itself, which saves the outer sed. But that would only make a
difference if there's a huge number of files in your output.

 Regards,
 Arnout
