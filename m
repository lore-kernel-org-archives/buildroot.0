From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 14:30:40 +0200
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 2.2.4
In-Reply-To: <20190801122241.31463-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 1 Aug 2019 14:22:41 +0200")
References: <20190801122241.31463-1-peter@korsgaard.com>
Message-ID: <87imqq66q7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2019-14232: Denial-of-service possibility in django.utils.text.Truncator

 > If django.utils.text.Truncator's chars() and words() methods were passed the
 > html=True argument, they were extremely slow to evaluate certain inputs due
 > to a catastrophic backtracking vulnerability in a regular expression.  The
 > chars() and words() methods are used to implement the truncatechars_html and
 > truncatewords_html template filters, which were thus vulnerable.

 > The regular expressions used by Truncator have been simplified in order to
 > avoid potential backtracking issues.  As a consequence, trailing punctuation
 > may now at times be included in the truncated output.

 > CVE-2019-14233: Denial-of-service possibility in strip_tags()

 > Due to the behavior of the underlying HTMLParser,
 > django.utils.html.strip_tags() would be extremely slow to evaluate certain
 > inputs containing large sequences of nested incomplete HTML entities.  The
 > strip_tags() method is used to implement the corresponding striptags
 > template filter, which was thus also vulnerable.

 > strip_tags() now avoids recursive calls to HTMLParser when progress removing
 > tags, but necessarily incomplete HTML entities, stops being made.

 > Remember that absolutely NO guarantee is provided about the results of
 > strip_tags() being HTML safe.  So NEVER mark safe the result of a
 > strip_tags() call without escaping it first, for example with
 > django.utils.html.escape().

 > CVE-2019-14234: SQL injection possibility in key and index lookups for
 > JSONField/HStoreField

 > Key and index lookups for django.contrib.postgres.fields.JSONField and key
 > lookups for django.contrib.postgres.fields.HStoreField were subject to SQL
 > injection, using a suitably crafted dictionary, with dictionary expansion,
 > as the **kwargs passed to QuerySet.filter().

 > CVE-2019-14235: Potential memory exhaustion in
 > django.utils.encoding.uri_to_iri()

 > If passed certain inputs, django.utils.encoding.uri_to_iri could lead to
 > significant memory usage due to excessive recursion when re-percent-encoding
 > invalid UTF-8 octet sequences.

 > uri_to_iri() now avoids recursion when re-percent-encoding invalid UTF-8
 > octet sequences.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I have instead bumped 2019.02.x and 2019.05.x to 2.1.11, which contains
the same fixes.

-- 
Bye, Peter Korsgaard
