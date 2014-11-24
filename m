From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Nov 2014 23:01:33 +0100
Subject: [Buildroot] [PATCH next v2] python-certifi: add new package
In-Reply-To: <20141122205900.5aa98365@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 22 Nov 2014 20:59:00 +0100")
References: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
 <20141122170934.GD4295@free.fr>
 <20141122190852.748af912@free-electrons.com>
 <20141122185640.GE4295@free.fr>
 <20141122205900.5aa98365@free-electrons.com>
Message-ID: <873898tg02.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Yann E. MORIN,
 > On Sat, 22 Nov 2014 19:56:40 +0100, Yann E. MORIN wrote:

 >> > > sha1   f53dc8f57aaf6d69c183ebadcec52ece0a55cc3f                         certifi-14.05.14.tar.gz
 >> > > sha256 1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69 certifi-14.05.14.tar.gz
 >> > 
 >> > Why do we suggest to have two hashes? Isn't sha265 sufficient?
 >> 
 >> As Gustavo said, that's because sha1 and sha256 are two different hash
 >> mechanisms, and it's better to have both.
 >> 
 >> So I was following his advice, even though I don't mind adding just the
 >> sha256.

 > Hum. We need some decision here :)

Ehh, I don't really know. I believe we have agreed on adding an extra
hash if upstream only publishes a weak one (E.G. md5), but requiring
both sha1 and sha256 is imho overkill.

In general, I would say lets use sha256 if we need to calculate it
ourselves, and otherwise whatever upstream publishes (unless it is md5,
then we add sha256 ourselves).


>> Note: the number of spaces does not matter, so one can use spaces to
 >> properly align the different fields.

 > And Peter, when reviewing the scancpan script, which did align things
 > with spaces, was wondering why the script was doing this weird
 > indentation.

 > We also need some decision here :-)

Well, there's the spaces between the hashtype and the hash, and then
there's the space between the hash and the filename. I find it nicer to
read if the hashes are aligned, and I prefer to be able to use the
output of ${foo}sum directly for the hash + filename, which I why I
suggested:

type\thash  filename

(two spaces between hash and filename) during the scanpan review, so you
can do stuff like:

for i in md5 sha256; do echo -en "$i\t"; ${i}sum <file>; done > foo.hash

But it is not something I feel strongly about. Consistency between the
different packages would be good though.

-- 
Bye, Peter Korsgaard
