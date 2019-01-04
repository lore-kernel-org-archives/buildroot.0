From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 4 Jan 2019 16:30:05 +0100
Subject: [Buildroot] [PATCH v3] core/pkg-generic: only save latest
 package list
In-Reply-To: <20190104131250.GA19623@scaer>
References: <20180501132629.4a4831bb.john@metanate.com>
 <20180501122841.13818-1-john@metanate.com> <20190104131250.GA19623@scaer>
Message-ID: <25b04dd9-68de-9f1e-c830-fa6e86cb6d68@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/01/2019 14:12, Yann E. MORIN wrote:
> John. All,
> 
> On 2018-05-01 13:28 +0100, John Keeping spake thusly:
>> When rebuilding a package, simply appending the package's file list to
>> the global list means that the package list grows for every rebuild, as
> 
> Is there a particular issue with those three files growing on rebuild?

The problem is that not only does this makes the file list grow, it also
adds loads of incorrect data: when rebuilding a package that was
compiled early, all files modified since the package was built will be
included. So the list will include files that have been installed by
this package and all packages compiled after it. For some core packages,
this usually means "almost everything".

> Compared to the rest of the build tree, those three files have very
> small sizes in fact, and if they eventually end up big enough to be a
> substantial part of the build tree, it's most probably time for a clean
> build from scratch anyway, no?

Having a big list would not a problem if nobody used the content of this
file, but some tools scans it and use it to check files. After many
recompiling, I remember having problems with one tool taking a
considerable amount of time for each build because of all the duplicates
in the list. But i don't remember which tool it was.
