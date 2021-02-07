From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Feb 2021 10:35:44 +0100
Subject: [Buildroot] [PATCH] package/plg-utils: escape \ in generated
 legal-info
In-Reply-To: <20210206085102.1017439-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 6 Feb 2021 09:51:02 +0100")
References: <20210206085102.1017439-1-yann.morin.1998@free.fr>
Message-ID: <87sg681aq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In the output of legal-info, which is JSON-formatted, we include the
 > CPI_ID (when it is valid).

 > For xerces, the CPE_IS contains two sequences aof \+ (which is exactly
 > what is present in the NIST DB, [0]).

 > However, in JSON, like in C, \ escapes the following character; only a
 > very limited set of characters are valid to escape: " \ / b f n r t u.
 > Escaping any other character is invalid. Conformant JSON parser will
 > choke on invalid sequences, and so does not the json python module:

 >       File "/usr/lib/python2.7/json/decoder.py", line 380, in raw_decode
 >         obj, end = self.scan_once(s, idx)
 >     ValueError: Invalid \escape: line 1 column 608554 (char 608553)

 > We fix that be globally escaping \ in our json output, in the generic
 > sanitsing macro.

 > [0] https://nvd.nist.gov/products/cpe/detail/645?namingFormat=2.3&orderBy=CPEURI&keyword=xerces&status=FINAL

I still wonder if it wouldn't be better to not have the backslashes in
the variable and do whatever escaping is needed inside the CVE logic,
but OK - We need a quick fix and this solves it.

Perhaps we should add a gitlab test to verify that we generate valid
json, E.G. by piping it to jq (or similar).

Committed, thanks.

-- 
Bye, Peter Korsgaard
